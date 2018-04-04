#' @include AllClasses.R
NULL

# slot getters ------------------------
#' Get the minid identifier
#'
#' @param x minid object
#' 
#' @examples
#' load(minid_example(filename = "demo.rda"))
#' identifier(demo)
#' 
#' @import methods
#' @export
setGeneric("identifier", function(x) standardGeneric("identifier"))

#' Get the minid creator
#'
#' @param x minid object
#' 
#' @examples
#' load(minid_example(filename = "demo.rda"))
#' creator(demo)
#' 
#' @import methods
#' @export
setGeneric("creator", function(x) standardGeneric("creator"))

#' Get the minid created date
#'
#' @param x minid object
#' 
#' @examples
#' load(minid_example(filename = "demo.rda"))
#' created(demo)
#' 
#' @import methods
#' @export
setGeneric("created", function(x) standardGeneric("created"))

#' Get the minid checksum
#'
#' @param x minid object
#' 
#' @examples
#' load(minid_example(filename = "demo.rda"))
#' checksum(demo)
#' 
#' @import methods
#' @export
setGeneric("checksum", function(x) standardGeneric("checksum"))

#' Get the minid status
#'
#' @param x minid object
#' 
#' @examples
#' load(minid_example(filename = "demo.rda"))
#' status(demo)
#' 
#' @import methods
#' @export
setGeneric("status", function(x) standardGeneric("status"))

#' Get the minid locations
#'
#' @param x minid object
#' 
#' @examples
#' load(minid_example(filename = "demo.rda"))
#' locations(demo)
#' 
#' @import methods
#' @export
setGeneric("locations", function(x) standardGeneric("locations"))

#' Get the minid titles
#'
#' @param x minid object
#' 
#' @examples
#' load(minid_example(filename = "demo.rda"))
#' titles(demo)
#' 
#' @import methods
#' @export
setGeneric("titles", function(x) standardGeneric("titles"))
