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
#' \code{load_configuration()} loads the json- or python-style config file and
#' returns a configuration object.
#'
#' @param config_file Path to the configuration file (default
#'   "~/.minid/minid-config.json")
#'
#' @return An object of type "configuration"
#'
#' @examples
#' \dontrun{
#'
#' configuration <-
#'   load_configuration(config_file = "~/.minid/minid-config.json")
#' }
#'
#' @export

load_configuration <-
  function(config_file = "~/.minid/minid-config.json" #nolint
           ) {
    if (config_file == "~/.minid/minid-config.json") { #nolint
      config_file <- paste0(path.expand("~"),
                            "/.minid/minid-config.json") #nolint
    }

    # if the config file is json, load it that way:
    if (configr::is.json.file(config_file)){

      # load json to list
      json_configuration <- configr::read.config(config_file)
      json_configuration <- json_configuration$default

      # instantiate configuration object
      config <- configuration()

      # populate configuration slots
      server(config) <- json_configuration$minid_server[[1]]
      user(config) <- json_configuration$username[[1]]
      email(config) <- json_configuration$email[[1]]
      orcid(config) <- json_configuration$orcid[[1]]
      code(config) <- json_configuration$code[[1]]
      return(config)
    # if config file is python-style text
    } else if (
      stringr::str_detect(readr::read_file(config_file), "\\[general\\]")
      ) {
      raw_config <- readr::read_file(config_file)
      test <- readr::read_delim(
        gsub(": ", "=", raw_config),
        delim = "=",
        comment = "[",
        col_names = FALSE)
      parsed_config <- stats::setNames(test$X2, test$X1)

      # instantiate configuration object
      config <- configuration()

      # populate configuration slots
      server(config) <- parsed_config[["minid_server"]]
      user(config) <- parsed_config[["user"]]
      email(config) <- parsed_config[["email"]]
      if ("orcid" %in% names(parsed_config)) {
        orcid(config) <- parsed_config[["orcid"]]
      }
      code(config) <- parsed_config[["code"]]
      return(config)
    } else {
      stop("Unsupported config file format")
    }
  }

#' Save minid configuration object to config file
#'
#' Before using the minid API to mint a new minid, you first need to validate
#' your email address (using register_user()). Following registration, a unique
#' code will be sent to your email address. You must present this code along
#' with your email address when accessing the API.
#'
#' As a convenience you can specify this information in a minid configuration
#' file (default location is ~/.minid/minid-config.json). This configuration
#' file can be either JSON (default) or the format descrived for the python
#' minid client package \url{https://github.com/fair-research/minid}.
#'
#'
#' \code{save_configuration(config)} saves the configuration object config as
#' a json- or python-style config file at \code{~/.minid/minid-config.json}.
#'
#' @param config an object of type configuration
#'
#' @param config_path Path to the configuration file (default
#'   "~/.minid/minid-config.json")
#'
#' @param python_style write python-style config file (default FALSE)
#'
#' @param overwrite overwrite existing configuration file? (default FALSE)
#'
#' @examples
#' \dontrun{
#'
#' config <- configuration(
#'    server = "http://minid.bd2k.org/minid/",
#'    user = "Jane Smith",
#'    email = "jsmith@example.com",
#'    orcid = "0000-0003-2898-9044",
#'    code = "XXXX-XXX-XXXXX-XXXX-XXXX"
#'  )
#'
#'   save_configuration(config, config_path = "~/.minid/minid-config.json")
#' }
#'
#' @export

save_configuration <-
  function(config,
           config_path = "~/.minid/minid-config.json", #nolint,
           python_style = FALSE,
           overwrite = FALSE
           ) {
    if (config_path == "~/.minid/minid-config.json") { #nolint
      config_file <- paste0(path.expand("~"),
                            "/.minid/minid-config.json") #nolint
    }

    if (file.exists(config_path) & overwrite == FALSE) {
      stop("Config file already exists. Set overwrite = TRUE to overwrite")
    }

    if (file.exists(config_path)) {
      message("Overwritting existing config file.")
    }

    # write python style config file if desired
    if (python_style) {
      message("Writing python style config file.")

      save_string <- paste0(
        "[general]\n",
        "minid_server: ", server(config), "\n",
        "user: ", user(config), "\n",
        "email: ", email(config), "\n",
        "orcid: ", orcid(config), "\n",
        "code: ", code(config), "\n"
      )

      readr::write_file(save_string, config_path)

      return()
    }

    # else write json (default)
    save_string <-
      stringr::str_replace(
        jsonlite::toJSON(list(default = as.list(config))),
        "server",
        "minid_server"
        )[[1]]

    readr::write_file(save_string, config_path)
    return()
    }

# minid functions --------------------------

#' Resolve a minid by identifier or file name
#'
#' Query the minid server specified in the configuration object to retrieve
#' minid metadata about an identifier or file.
#'
#' NOTE: lookup currently supports minids of the form "ark:/57799/b9j69h" or
#' "mind:b9j69h"
#'
#' @param query the minid to look up, specified by identifier (e.g.
#'   "ark:/57799/b9j69h" or "minid:b9j69h") or file name (e.g.
#'   "file:./some/file.RDa")
#'
#' @param algo the hashing algorighm to use for file-based minid lookups
#'   (default "md5")
#'
#' @param server the minid resolution server. Can be obtained from
#'   configuration object with server(config). Default =
#'   "http://minid.bd2k.org/minid" (see also \code{\link{load_configuration}})
#'
#' @return An object of type "minid" or an error if the lookup fails
#'
#' @examples
#' \dontrun{
#'
#' my_minid <- lookup(query = "ark:/57799/b9j69h", server = server(config))
#' my_minid <- lookup(query = "minid:b9j69h", server = server(config))
#' my_minid <- lookup(query = "file:./some/file.RDa", algo = "md5",
#'                    server = server(config))
#'
#' }
#'
#' @export

lookup <- function(query, server = "http://minid.bd2k.org/minid", algo = "md5"){
  server_url <- server
  # do checksum-based lookup for file:
  if (stringr::str_detect(query, "^file:")) {
    path <- stringr::str_remove(query, "^file:")
    checksum <- digest::digest(file = path, algo)
    # set url for hash lookup
    url <- paste0(server_url, "/", checksum)
  # do id-based lookup for minid:
  } else if (stringr::str_detect(query, "^minid:")) {
    query <- stringr::str_replace(query, "^minid:", "ark:/57799/")
    # set url for minid lookup
    url <- paste0(server_url, "/", query)
  # do id-based lookup for ark:
  } else if (stringr::str_detect(query, "^ark:")) {
    url <- paste0(server_url, "/", query)
  # try a checksum lookup for a string
  } else {
    url <- paste0(server_url, "/", query)
  }

  # set user agent
  ua <- httr::user_agent("https://github.com/bheavner/minidtools")

  # send request
  resp <- httr::GET(url, ua)

  # check for JSON response
  if (httr::http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  # parse json
  parsed <- jsonlite::fromJSON(httr::content(resp, "text", encoding = "UTF-8"),
                               simplifyVector = FALSE)

  # catch errors
  if (httr::http_error(resp)) {
    stop(
      sprintf(
        "BD2K minid API request failed [%s]\n%s\n<%s>",
        httr::status_code(resp),
        parsed$message,
        parsed$documentation_url
      ),
      call. = FALSE
    )
  }

  # instantiate minid object
  new_minid <- minid()

  # fill minid slots NOTE: assumes API only returns one minid per query
  if (length(parsed) == 0) {
    stop("No results for that query.")
  }
  parsed <- parsed[[1]]

  checksum(new_minid) <- as.character(parsed$checksum)
  checksum_function(new_minid) <- as.character(parsed$checksum_function)
  content_key(new_minid) <- as.character(parsed$content_key)
  created(new_minid) <- as.character(parsed$created)
  creator(new_minid) <- as.character(parsed$creator)
  identifier(new_minid) <- as.character(parsed$identifier)
  short_identifier(new_minid) <- as.character(parsed$short_identifier)

  # check before adding optional slots
  if ("orcid" %in% names(parsed)) {
    orcid(new_minid) <- as.character(parsed$orcid)
  }

  if ("status" %in% names(parsed)) {
    status(new_minid) <- as.character(parsed$status)
  }


  # list items require a bit more processing...
  # build list of locations
  locations_list <- vector("list", length = length(parsed$locations))

  for (index in seq(length(parsed$locations))) {
    locations_list[[index]] <- list(
      "created" = parsed$locations[[index]]$created,
      "creator" = parsed$locations[[index]]$creator,
      "link" = parsed$locations[[index]]$link,
      "uri" = parsed$locations[[index]]$uri
    )
  }
  # assign to slot
  locations(new_minid) <- locations_list

  # build list of titles
  titles_list <- vector("list", length = length(parsed$titles))

  for (index in seq(length(parsed$titles))) {
    titles_list[[index]] <- list(
      "created" = parsed$titles[[index]]$created,
      "creator" = parsed$titles[[index]]$creator,
      "title" = parsed$titles[[index]]$title
    )
  }
  # assign to slot
  titles(new_minid) <- titles_list

  # and an optional list
  if ("obsoleted_by" %in% names(parsed)) {
    if (length(parsed$obsoleted_by) == 0) {
      obsoleted_by_list <- list(" ")
      obsoleted_by(new_minid) <- obsoleted_by_list
    } else {
      for (index in seq(length(parsed$obsoleted_by))) {
        obsoleted_by_list <- vector("list",
                                    length = length(parsed$obsoleted_by))
        obsoleted_by_list[[index]] <- parsed$obsoleted_by[[index]]
        obsoleted_by(new_minid) <- obsoleted_by_list
      }
    }
  }

  # return our object
  new_minid
}


# misc utility functions --------------------------------------
#' hack to pass devtools::check()
#' see: https://stackoverflow.com/questions/9439256/
#' @noRd
utils::globalVariables(c("config", "default"))
