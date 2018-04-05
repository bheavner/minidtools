# coerce minid object to other data types

#' @include AllClasses.R
#' @include AllGenerics.R
NULL

# to list --------------------------------------------------
#' as.list
#'
#' Coerce minid object to list
#'
#' @param x minid object
#' @param ... other arguments (not used, but included for consistency with base
#'   generic)
#'
#' @usage as.list(x, ...)
#'
#' @aliases as.list
#'
#' @return a named list
#'
#' @examples
#' \dontrun{
#' as.list(minid_object)
#' }
#'
#' @import methods
#' @export
setMethod("as.list",
          signature = "minid",
          function(x) {
            list(identifier = identifier(x),
                 creator = creator(x),
                 created = created(x),
                 checksum = checksum(x),
                 checksum_function = checksum_function(x),
                 status = status(x),
                 locations = locations(x),
                 titles = titles(x),
                 obsoleted_by = obsoleted_by(x),
                 content_key = content_key(x))
          }
)