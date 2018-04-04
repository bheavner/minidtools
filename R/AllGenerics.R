#' @include AllClasses.R
NULL

# slot getters ------------------------
#' identifier
#' 
#' Get the minid identifier
#'
#' @name identifier
#' @rdname identifier
#' 
#' @param x minid object
#' 
#' @usage identifier(x)
#' 
#' @return The minid identifier string
#' 
#' @examples
#' data("demo", package = "minidtools")
#' identifier(demo)
#' 
#' @export
methods::setGeneric("identifier", function(x) standardGeneric("identifier"))


#' creator
#' 
#' Get the minid creator
#'
#' @param x minid object
#' 
#' @return The minid creator string
#' 
#' @examples
#' data("demo", package = "minidtools")
#' creator(demo)
#' 
#' @name creator
#' @rdname creator
#' 
#' @export
methods::setGeneric("creator", function(x) standardGeneric("creator"))

#' created
#' 
#' Get the minid created date
#'
#' @param x minid object
#' 
#' @return The date the minid was created (as character string)
#' 
#' @examples
#' data("demo", package = "minidtools")
#' created(demo)
#' 
#' @name created
#' @rdname created
#' 
#' @export
methods::setGeneric("created", function(x) standardGeneric("created"))

#' checksum
#' 
#' Get the minid checksum
#'
#' @param x minid object
#' 
#' @return The minid checksum (as character string)
#' 
#' @examples
#' data("demo", package = "minidtools")
#' checksum(demo)
#' 
#' @name checksum
#' @rdname checksum
#'
#' @export
methods::setGeneric("checksum", function(x) standardGeneric("checksum"))

#' status
#' 
#' Get the minid status
#'
#' @param x minid object
#' 
#' @return The minid status (as character string)
#' 
#' @examples
#' data("demo", package = "minidtools")
#' status(demo)
#' 
#' @name status
#' @rdname status
#' 
#' @export
methods::setGeneric("status", function(x) standardGeneric("status"))

#' locations
#' 
#' Get the minid locations
#'
#' @param x minid object
#' 
#' @return The minid locations (as list)
#' 
#' @examples
#' data("demo", package = "minidtools")
#' locations(demo)
#' 
#' @name locations
#' @rdname locations
#' 
#' @export
methods::setGeneric("locations", function(x) standardGeneric("locations"))

#' titles
#' 
#' Get the minid titles
#'
#' @param x minid object
#' 
#' @return The minid titles (as list)
#' 
#' @examples
#' data("demo", package = "minidtools")
#' titles(demo)
#' 
#' @name titles
#' @rdname titles
#' 
#' @export
methods::setGeneric("titles", function(x) standardGeneric("titles"))
