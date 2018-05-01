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
            if (length(locations(object)) == 0) {
              location_str <- ""
            } else {
              location_str <- locations(object)[[1]]$link
            }
            if (length(titles(object)) == 0) {
              title_str <- ""
            } else {
              title_str <- titles(object)[[1]]$title
            }
            if (length(obsoleted_by(object)) == 0) {
              obsoleted_by_str <- ""
            } else {
              obsoleted_by_str <- obsoleted_by(object)[[1]]
            }

            string <- paste0(
              "MINID:", "\n",
              "  identifier = ", identifier(object), "\n",
              "  short_identifier = ", short_identifier(object), "\n",
              "  creator = ", creator(object), "\n",
              "  orcid = ", orcid(object), "\n",
              "  created = ", created(object), "\n",
              "  checksum = ", checksum(object), "\n",
              "  checksum_function = ", checksum_function(object), "\n",
              "  status = ", status(object), "\n",
              "  locations = ", location_str, "\n", # list
              "    (use locations(object) for more)\n",
              "  titles = ", title_str, "\n", # list
              "    (use titles(object) for more)\n",
              "  obsoleted_by = ", obsoleted_by_str, "\n", # list
              "    (use obsoleted_by(object) for more)\n",
              "  content_key = ", content_key(object), "\n"
            )
            cat(string)
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
