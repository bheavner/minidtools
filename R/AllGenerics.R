#' @include AllClasses.R
NULL

# minid slot getters ------------------------
#' identifier
#'
#' Get the minid identifier
#'
#' @param x minid object
#'
#' @usage identifier(x)
#'
#' @return The minid identifier string
#'
#' @examples
#' \dontrun{
#' identifier(minid_object)
#' }
#'
#' @import methods
#' @export
setGeneric("identifier", function(x) standardGeneric("identifier"))

#' short identifier
#'
#' Get the minid short identifier
#'
#' @param x minid object
#'
#' @usage short_identifier(x)
#'
#' @return The minid short identifier string
#'
#' @examples
#' \dontrun{
#' short_identifier(minid_object)
#' }
#'
#' @import methods
#' @export
setGeneric("short_identifier", function(x) standardGeneric("short_identifier"))

#' creator
#'
#' Get the minid creator
#'
#' @param x minid object
#'
#' @return The minid creator string
#'
#' @examples
#' \dontrun{
#' creator(minid_object)
#' }
#'
#' @import methods
#' @export
setGeneric("creator", function(x) standardGeneric("creator"))

#' orcid
#'
#' Get the minid orcid
#'
#' @param x minid object
#'
#' @return The minid orcid string
#'
#' @examples
#' \dontrun{
#' orcid(minid_object)
#' }
#'
#' @import methods
#' @export
setGeneric("orcid", function(x) standardGeneric("orcid"))

#' created
#'
#' Get the minid created date
#'
#' @param x minid object
#'
#' @return The date the minid was created (as character string)
#'
#' @examples
#' \dontrun{
#' created(minid_object)
#' }
#'
#' @import methods
#' @export
setGeneric("created", function(x) standardGeneric("created"))

#' checksum
#'
#' Get the minid checksum
#'
#' @param x minid object
#'
#' @return The minid checksum (as character string)
#'
#' @examples
#' \dontrun{
#' checksum(minid_object)
#' }
#'
#' @import methods
#' @export
setGeneric("checksum", function(x) standardGeneric("checksum"))

#' checksum_function
#'
#' Get the hashing function used to make the minid checksum
#'
#' @param x minid object
#'
#' @return The minid checksum_function (as character string)
#'
#' @examples
#' \dontrun{
#' checksum_function(minid_object)
#' }
#'
#' @import methods
#' @export
setGeneric("checksum_function",
           function(x) standardGeneric("checksum_function"))

#' status
#'
#' Get the minid status
#'
#' @param x minid object
#'
#' @return The minid status (as character string)
#'
#' @examples
#' \dontrun{
#' status(minid_object)
#' }
#'
#' @import methods
#' @export
setGeneric("status", function(x) standardGeneric("status"))

#' locations
#'
#' Get the minid locations
#'
#' @param x minid object
#'
#' @return The minid locations (as list)
#'
#' @examples
#' \dontrun{
#' locations(minid_object)
#' }
#'
#' @import methods
#' @export
setGeneric("locations", function(x) standardGeneric("locations"))

#' titles
#'
#' Get the minid titles
#'
#' @param x minid object
#'
#' @return The minid titles (as list)
#'
#' @examples
#' \dontrun{
#' titles(minid_object)
#' }
#'
#' @import methods
#' @export
setGeneric("titles", function(x) standardGeneric("titles"))

#' obsoleted_by
#'
#' Get the minid obsoleted_by slot
#'
#' @param x minid object
#'
#' @return The minid obsoleted_by slot (as list)
#'
#' @examples
#' \dontrun{
#' obsoleted_by(minid_object)
#' }
#'
#' @import methods
#' @export
setGeneric("obsoleted_by", function(x) standardGeneric("obsoleted_by"))

#' content_key
#'
#' Get the minid content_key slot
#'
#' @param x minid object
#'
#' @return The minid content_key slot
#'
#' @examples
#' \dontrun{
#' content_key(minid_object)
#' }
#'
#' @import methods
#' @export
setGeneric("content_key", function(x) standardGeneric("content_key"))

# minid slot setters ------------------------
#' identifier
#'
#' Set the minid identifier
#'
#' @param x minid object
#' @param value the new identifier string
#'
#' @return The minid object with specified identifier string
#'
#' @examples
#' \dontrun{
#' identifier(minid_object) <- "ark:/57799/b9j69h"
#' }
#'
#' @import methods
#' @export
setGeneric("identifier<-", function(x, value) standardGeneric("identifier<-"))

#' short identifier
#'
#' Set the minid short identifier
#'
#' @param x minid object
#' @param value the new short identifier string
#'
#' @return The minid object with specified short identifier string
#'
#' @examples
#' \dontrun{
#' short_identifier(minid_object) <- "minid:b9j69h"
#' }
#'
#' @import methods
#' @export
setGeneric("short_identifier<-", function(x, value) {
  standardGeneric("short_identifier<-")
  })

#' creator
#'
#' Set the minid creator
#'
#' @param x minid object
#' @param value the new creator string
#'
#' @return The minid object with specified creator string
#'
#' @examples
#' \dontrun{
#' creator(minid_object) <- "mdarcy (<id string>)"
#' }
#'
#' @import methods
#' @export
setGeneric("creator<-", function(x, value) standardGeneric("creator<-"))

#' orcid
#'
#' Set the minid orcid
#'
#' @param x minid object
#' @param value the new orcid string
#'
#' @return The minid object with specified orcid string
#'
#' @examples
#' \dontrun{
#' orcid(minid_object) <- "mdarcy (<id string>)"
#' }
#'
#' @import methods
#' @export
setGeneric("orcid<-", function(x, value) standardGeneric("orcid<-"))

#' created
#'
#' Set the minid created date
#'
#' @param x minid object
#' @param value the new created string
#'
#' @return The minid object with specified created string
#'
#' @examples
#' \dontrun{
#' created(minid_object) <- "Mon, 19 Mar 2018 17:43:57 GMT"
#' }
#'
#' @import methods
#' @export
setGeneric("created<-", function(x, value) standardGeneric("created<-"))

#' checksum
#'
#' Set the minid checksum
#'
#' @param x minid object
#' @param value the new checksum string
#'
#' @return The minid object with specified checksum string
#'
#' @examples
#' \dontrun{
#' a_hash <-"6484968f81afac84857d02b573b0d589fb2f9582a2b920572830dc5781e0a53c"
#' checksum(minid_object) <- a_hash
#' }
#'
#' @import methods
#' @export
setGeneric("checksum<-", function(x, value) standardGeneric("checksum<-"))

#' checksum_function
#'
#' Set the minid checksum_function
#'
#' @param x minid object
#' @param value the new checksum_function string
#'
#' @return The minid object with specified checksum_function string
#'
#' @examples
#' \dontrun{
#' checksum_function(minid_object) <- "SHA"
#' }
#'
#' @import methods
#' @export
setGeneric("checksum_function<-",
           function(x, value) standardGeneric("checksum_function<-"))

#' status
#'
#' Set the minid status
#'
#' @param x minid object
#' @param value the new status string
#'
#' @return The minid object with specified status string
#'
#' @examples
#' \dontrun{
#' status(minid_object) <- "ACTIVE"
#' }
#'
#' @import methods
#' @export
setGeneric("status<-", function(x, value) standardGeneric("status<-"))

#' locations
#'
#' Set the minid locations
#'
#' @param x minid object
#' @param value the new locations list
#'
#' @return The minid object with specified locations list
#'
#' @examples
#' \dontrun{
#' locations(minid_object) <-
#'   list("mdarcy - https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz")
#' }
#'
#' @import methods
#' @export
setGeneric("locations<-", function(x, value) standardGeneric("locations<-"))

#' titles
#'
#' Set the minid titles
#'
#' @param x minid object
#' @param value the new titles list
#'
#' @return The minid object with specified titles list
#'
#' @examples
#' \dontrun{
#' title_list <-
#'   list(list(created = "Mon, 19 Mar 2018 17:43:57 GMT",
#'     creator = "mdarcy",
#'     title = paste0("AGR Data set with identifier-based references to",
#'               "data in cloud storage")))
#' titles(minid_object) <- title_list
#' }
#'
#' @import methods
#' @export
setGeneric("titles<-", function(x, value) standardGeneric("titles<-"))

#' obsoleted_by
#'
#' Set the minid obsoleted_by
#'
#' @param x minid object
#' @param value the new obsoleted_by list
#'
#' @return The minid object with specified obsoleted_by list
#'
#' @examples
#' \dontrun{
#' obsoleted_by(minid_object) <- list("ark:/57799/b9j69h")
#' }
#'
#' @import methods
#' @export
setGeneric("obsoleted_by<-",
           function(x, value) standardGeneric("obsoleted_by<-"))

#' content_key
#'
#' Set the minid content_key
#'
#' @param x minid object
#' @param value the new content_key string
#'
#' @return The minid object with specified content_key
#'
#' @examples
#' \dontrun{
#' a_hash <-"6484968f81afac84857d02b573b0d589fb2f9582a2b920572830dc5781e0a53c"
#' content_key(minid_object) <- a_hash
#' }
#'
#' @import methods
#' @export
setGeneric("content_key<-",
           function(x, value) standardGeneric("content_key<-"))

# configuration slot getters --------------------
#' server
#'
#' Get the minid server from the configuration object
#'
#' @param x configuration object
#'
#' @usage server(x)
#'
#' @return The minid server URL
#'
#' @examples
#' \dontrun{
#' server(configuration_object)
#' }
#'
#' @import methods
#' @export
setGeneric("server", function(x) standardGeneric("server"))

#' user
#'
#' Get the user from the configuration object
#'
#' @param x configuration object
#'
#' @usage user(x)
#'
#' @return The user
#'
#' @examples
#' \dontrun{
#' user(configuration_object)
#' }
#'
#' @import methods
#' @export
setGeneric("user", function(x) standardGeneric("user"))

#' email
#'
#' Get the email from the configuration object
#'
#' @param x configuration object
#'
#' @usage email(x)
#'
#' @return The email
#'
#' @examples
#' \dontrun{
#' email(configuration_object)
#' }
#'
#' @import methods
#' @export
setGeneric("email", function(x) standardGeneric("email"))

#' orcid
#'
#' Get the orcid from the configuration object
#'
#' @param x configuration object
#'
#' @usage orcid(x)
#'
#' @return The orcid
#'
#' @examples
#' \dontrun{
#' orcid(configuration_object)
#' }
#'
#' @import methods
#' @export
setGeneric("orcid", function(x) standardGeneric("orcid"))

#' code
#'
#' Get the code from the configuration object
#'
#' @param x configuration object
#'
#' @usage code(x)
#'
#' @return The code
#'
#' @examples
#' \dontrun{
#' code(configuration_object)
#' }
#'
#' @import methods
#' @export
setGeneric("code", function(x) standardGeneric("code"))

# configuration slot setters --------------------
#' server
#'
#' Set the minid server URL in configuration object
#'
#' @param x configuration object
#' @param value the new server URL
#'
#' @return The configuration object with specified server URL
#'
#' @examples
#' \dontrun{
#' server(configuration_object) <- "http://minid.bd2k.org/minid"
#' }
#'
#' @import methods
#' @export
setGeneric("server<-", function(x, value) standardGeneric("server<-"))


#' user
#'
#' Set the minid user in configuration object
#'
#' @param x configuration object
#' @param value the new user string
#'
#' @return The configuration object with specified user string
#'
#' @examples
#' \dontrun{
#' user(configuration_object) <- "Jane Smith"
#' }
#'
#' @import methods
#' @export
setGeneric("user<-", function(x, value) standardGeneric("user<-"))

#' email
#'
#' Set the minid user email in configuration object
#'
#' @param x configuration object
#' @param value the new user email string
#'
#' @return The configuration object with specified user email string
#'
#' @examples
#' \dontrun{
#' email(configuration_object) <- "jsmith@example.com"
#' }
#'
#' @import methods
#' @export
setGeneric("email<-", function(x, value) standardGeneric("email<-"))

#' orcid
#'
#' Set the minid user's orcid in configuration object
#'
#' @param x configuration object
#' @param value the new user orcid string
#'
#' @return The configuration object with specified user orcid string
#'
#' @examples
#' \dontrun{
#' orcid(configuration_object) <- "0000-0003-2898-9044"
#' }
#'
#' @import methods
#' @export
setGeneric("orcid<-", function(x, value) standardGeneric("orcid<-"))

#' code
#'
#' Set the minid user's access code
#'
#' @param x configuration object
#' @param value the new user access code string
#'
#' @return The configuration object with specified user access code
#'
#' @examples
#' \dontrun{
#' code(configuration_object) <- "XXXX-XXX-XXXXX-XXXX-XXXX"
#' }
#'
#' @import methods
#' @export
setGeneric("code<-", function(x, value) standardGeneric("code<-"))

# register user ----------------------------
