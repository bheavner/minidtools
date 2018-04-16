#' @include AllClasses.R
#' @include AllGenerics.R
#' @include AllConstructors.R
NULL

# minid show method -------------

#' show method for minid object
#'
#' @param object minid object
#'
#' @examples
#' \dontrun{
#' show(minid_object)
#' minid_object
#' }
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
                "  titles = ", unlist(titles(object)), "\n", # not sure - list
                "  obsoleted_by = ", unlist(obsoleted_by(object)), "\n", # list
                "  content_key = ", content_key(object), "\n",
                sep = "")
          }
)

# configuration show method -------------

#' show method for configuration object
#'
#' @param object configuration object
#'
#' @examples
#' \dontrun{
#' show(configuration_object)
#' configuration_object
#' }
#'
#' @import methods
#' @export
setMethod("show", signature = "configuration",
          function(object){
            cat("Configuration:", "\n",
                "  server = ", server(object), "\n",
                "  user = ", user(object), "\n",
                "  email = ", email(object), "\n",
                "  orcid = ", orcid(object), "\n",
                "  code = ", code(object), "\n",
                sep = "")
          }
)
