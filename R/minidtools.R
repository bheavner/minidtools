# a place for package documentation and some general utility functions

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
  function(config_file = "~/.minid/minid-config.json",
           section = "default") {
    if (config_file == "~/.minid/minid-config.json") {
      config_file <- paste0(path.expand("~"), "/.minid/minid-config.json")
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
