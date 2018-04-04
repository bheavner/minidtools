#' @include AllClasses.R
#' @include AllGenerics.R
#' @include AllConstructors.R
NULL

# show method

#' show method for minid object
#'
#' @param object minid object
#' 
#' @examples
#' data("demo", package = "minidtools")
#' show(demo)
#' 
#' @import methods
#' @export
setMethod("show", signature = "minid",
          function(object){
            cat("MINID:", "\n", "  identifier = ", identifier(object), "\n",
                "  creator = ", creator(object), "\n",
                "  created = ", created(object), "\n",
                "  checksum = ", checksum(object), "\n",
                "  checksum_function = ", checksum_function(object), "\n",
                "  status = ", status(object), "\n",
                "  locations = ", unlist(locations(object)), "\n", # not sure
                "  title = ", unlist(titles(object)), "\n", # not sure
                sep = "")
          }
)
