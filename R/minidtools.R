# a place for package documentation and functions

# package documentatioon --------------

#' minidtools: An R package for interacting with MINimal viable IDentifiers.
#'
#' The \pkg{minidtools} package provides three categories of tools for working
#'   with minids:
#' user registry, querying minids, and creating minids.
#'
#' @section user registry:
#' The user registry functions ...
#'
#' @section querying minids:
#' \code{\link{identifier}} get the minid identifier
#'
#' \code{\link{creator}} get the minid creator
#'
#' \code{\link{created}} get the minid creation date
#'
#' \code{\link{checksum}} get the minid checksum
#'
#' \code{\link{checksum_function}} get the minid checksum hashing function
#'
#' \code{\link{status}} get the minid status
#'
#' \code{\link{locations}} get the minid locations
#'
#' \code{\link{titles}} get the minid titles
#'
#' @section creating minids:
#' The minid minting functions ...
#'
#' @section see also:
#' \code{?`\linkS4class{minid}`}
#'
#' @references \url{http://minid.bd2k.org/}
#'
#' @docType package
#' @name minidtools
NULL

# Config functions -----------------------------

#' Load minid configuration object from config file
#'
#' Before using the minid API to mint a new minid, you first need to validate
#' your email address (using register_user()). Following registration, a unique
#' code will be sent to your email address. You must present this code along
#' with your email address when accessing the API.
#'
#' As a convenience you can specify this information in a minid configuration
#' file (default location is ~/.minid/minid-config.json).
#'
#' \code{load_configuration()} loads the json-formatted config file and returns
#' a configuration object.
#'
#' @param config_file Path to the configuration file (default
#'   "~/.minid/minid-config.json")
#' @param section if multiple sections in the config file, which one to use
#'   (default "default")
#'
#' @return An object of type "configuration"
#'
#' @examples
#' \dontrun{
#'
#' configuration <-
#'   load_configuration(config_file = "~/.minid/minid-config.json",
#'                      section = "default")
#' }
#'
#' @export

load_configuration <-
  function(config_file = "~/.minid/minid-config.json", #nolint
           section = "default") {
    if (config_file == "~/.minid/minid-config.json") { #nolint
      config_file <- paste0(path.expand("~"),
                            "/.minid/minid-config.json") #nolint
    }

    # load json to list
    json_configuration <- config::get(file = config_file, config = section)

    # instantiate configuration object
    config <- configuration()

    # populate configuration slots
    server(config) <- json_configuration$minid_server[[1]]
    user(config) <- json_configuration$username[[1]]
    email(config) <- json_configuration$email[[1]]
    orcid(config) <- json_configuration$orcid[[1]]
    code(config) <- json_configuration$code[[1]]
    return(config)
  }

# minid functions --------------------------

#' Resolve a minid by identifier or file name
#'
#' Query the minid server specified in the configuration object to retrieve
#' minid metadata about an identifier or file.
#'
#' NOTE: lookup currently supports minids of the form "ark:/57799/b9j69h" or
#' "mind:b9j69h" or local files specified as "file:/path/to/file"
#'
#' @param query the minid to look up, specified by file name (e.g.
#'   "file:./some/file.Rda") or identifier (e.g. "ark:/57799/b9j69h" or
#'   "minid:b9j69h")
#'
#' @param configuration the configuration object. Default = config (see also
#'   \code{\link{load_configuration}})
#'
#' @param hash_function if performing a lookup on a file, which hash function
#' to use for querying (default "sha256")
#'
#' @return An object of type "minid" or an error if the lookup fails
#'
#' @examples
#' \dontrun{
#'
#' my_minid <- lookup(query = "ark:/57799/b9j69h", configuration = config)
#' my_minid <- lookup(query = "minid:b9j69h", configuration = config)
#'
#' my_minid <- lookup(query = "file:./some/file.Rda",
#'                    configuration = config,
#'                    hash = "sha256")
#'
#' }
#'
#' @export

lookup <- function(query, configuration = config, hash = "sha256"){
  # check if query is file path
  FILE_FLAG <- stringr::str_detect(query, "^file:")

  if (FILE_FLAG) {
    if (stringr::str_detect(query, "^file:~")){
      # no_prefix should be string after "file:" see stringr::str_remove()
      no_prefix <- stringr::str_remove(query, "^file:")
      file_path <- paste0(path.expand("~"), no_prefix)
    } else {
      file_path <- stringr::str_remove(query, "^file:")
    }
    hash_query <- digest::digest(file = file_path, hash)
  }

  if (stringr::str_detect(query, "^minid:")) {
    query <- stringr::str_replace(query, "^minid:", "ark:/5779/")
  }

  # do the query # handle errors
  landing_page_prefix <- "http://minid.bd2k.org/minid/landingpage/"
  full_url <- paste0(landing_page_prefix, "ark:/57799/", query)
  request_object  <-
    httr::GET(full_url,
              httr::add_headers(Accept = "application/json"))
  text_response <-
    httr::content(request_object, "text", encoding = "UTF-8");
  stopifnot(jsonlite::validate(text_response))
  minid_JSON <- jsonlite::fromJSON(text_response)

  # HERE'S A HACK
  if (is.null(minid_JSON$obsoleted_by)) {
    obsoleted <- list()
  } else {
    obsoleted <- list(minid_JSON$obsoleted_by)
  }

  # HERE'S A HACK
  if (is.null(minid_JSON$content_key)) {
    content_key <- vector(mode = "character")
  } else {
    content_key <- minid_JSON$content_key
  }

  # AND... HERE'S A HACK
  minid(identifier = minid_JSON$identifier,
        creator = minid_JSON$creator,
        created = minid_JSON$created,
        checksum = minid_JSON$checksum,
        checksum_function = minid_JSON$checksum_function,
        status = minid_JSON$status,
        locations = list(minid_JSON$locations[[3]]), # clean up
        titles = list(minid_JSON$titles[[3]]), # clean up
        obsoleted_by = obsoleted, # should be list or NULL
        content_key = content_key) # should be character
}


# misc utility functions --------------------------------------
