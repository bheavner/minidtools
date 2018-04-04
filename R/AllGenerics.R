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
#' #' \dontrun{
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
#' #' \dontrun{
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