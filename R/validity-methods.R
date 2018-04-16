#' @include AllClasses.R
#' @include AllGenerics.R
#' @include AllConstructors.R
NULL

#  minid validity method -----------------------------------------
# TODO: need to add Roxygen documentation for this
#' Check validity of minid object
#'
#' @name validMinid
#' @import methods
# #' @export
setValidity("minid",
            function(object){
              if (!(is.character(identifier(object)) |
                   is.null(identifier(object)))) {
                return("'identifier' slot must be a character string or NULL")
              }
              if (!is.character(creator(object))) {
                return("'creator' slot must be a character string")
              }
              if (!is.character(created(object))) {
                return("'created' slot must be a character string")
              }
              if (!(is.character(checksum(object)) |
                   is.null(checksum(object)))) {
                return("'checksum' slot must be a character string or NULL")
              }
              if (!(is.character(checksum_function(object)) |
                   is.null(checksum_function(object)))) {
                msg <- paste0("'checksum_function' slot must be a character ",
                              "string or NULL")
                return(msg)
              }
              # add check below
              if (!(is.character(status(object)) |
                   is.null(status(object)))) {
                return("'status' slot must be a character string or NULL")
              }
              # add to list check below
              if (!is.list(locations(object))) {
                msg <- paste0("'locations' slot must be a list")
                return(msg)
              }
              # add to list check below
              if (!is.list(titles(object))) {
                msg <- paste0("'titles' slot must be a list")
                return(msg)
              }
              # add to list check below
              if (!is.list(obsoleted_by(object))) {
                msg <- paste0("'obsoleted_by' slot must be a list")
                return(msg)
              }
              # add to list check below
              if (!is.character(content_key(object))) {
                return("'content_key' slot must be a character string")
              }
            }
)

#  configuration validity method -----------------------------------------
# TODO: need to add Roxygen documentation for this
#' Check validity of minid object
#'
#' @name validConfiguration
#' @import methods
# #' @export
setValidity("configuration",
            function(object){
              if (!(is.character(server(object)) |
                    is.null(server(object)))) {
                return("'server' slot must be a character string or NULL")
              }
              if (!is.character(user(object))) {
                return("'user' slot must be a character string")
              }
              if (!is.character(email(object))) {
                return("'email' slot must be a character string")
              }
              if (!(is.character(orcid(object)) |
                    is.null(orcid(object)))) {
                return("'orcid' slot must be a character string or NULL")
              }
              if (!(is.character(code(object)) |
                    is.null(code(object)))) {
                msg <- paste0("'code' slot must be a character ",
                              "string or NULL")
                return(msg)
              }
            }
)
