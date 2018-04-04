#' @include AllClasses.R
NULL

# slot getters ------------------------
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

# slot setters ------------------------
#' identifier
#' 
#' Set the minid identifier
#' 
#' @param x minid object
#' 
#' @usage identifier(x) <- "identifier string"
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

#' creator
#' 
#' Set the minid creator
#' 
#' @param x minid object
#' 
#' @usage creator(x) <- "creator string"
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

#' created
#' 
#' Set the minid created date
#' 
#' @param x minid object
#' 
#' @usage created(x) <- "created string"
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
#' 
#' @usage checksum(x) <- "checksum string"
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
#' 
#' @usage checksum_function(x) <- "checksum_function string"
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
#' 
#' @usage status(x) <- "status string"
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
#' 
#' @usage locations(x) <- "locations list"
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
#' 
#' @usage titles(x) <- "titles list"
#' 
#' @return The minid object with specified titles list
#' 
#' @examples
#' \dontrun{
#' title_list <- 
#'   list(paste0("mdarcy - AGR Data set with identifier-based references to ",
#'     "data in cloud storage"))
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
#' 
#' @usage obsoleted_by(x) <- "obsoleted_by list"
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
#' 
#' @usage content_key(x) <- "content_key string"
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