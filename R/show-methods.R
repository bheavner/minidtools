# show method

#' show method for minid object
#'
#' @param object minid object
#' 
#' @examples
#' load(minid_example(filename = "demo.rda"))
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
                "  status = ", status(object), "\n",
                "  locations = ", unlist(locations(object)), "\n", # not sure
                "  title = ", unlist(titles(object)), "\n", # not sure
                sep = "")
          }
)
