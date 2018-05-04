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
              if (!is.character(identifier(object))) {
                return("'identifier' slot must be a character string")
              }
              if (!is.character(short_identifier(object))) {
                return(paste0("'short_identifier' slot must be a character",
                              " string"))
              }
              if (!is.character(creator(object))) {
                return("'creator' slot must be a character string")
              }
              if (!is.character(orcid(object))) {
                return("'orcid' slot must be a character string")
              }
              if (!is.character(created(object))) {
                return("'created' slot must be a character string")
              }
              if (!is.character(checksum(object))) {
                return("'checksum' slot must be a character string")
              }
              if (!is.character(checksum_function(object))) {
                msg <- paste0("'checksum_function' slot must be a character ",
                              "string")
                return(msg)
              }
              # add check below
              if (!is.character(status(object))) {
                return("'status' slot must be a character string")
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
              if (!is.character(server(object))) {
                return("'server' slot must be a character string")
              }
              if (!is.character(user(object))) {
                return("'user' slot must be a character string")
              }
              if (!is.character(email(object))) {
                return("'email' slot must be a character string")
              }
              if (!is.character(orcid(object))) {
                return("'orcid' slot must be a character string")
              }
              if (!is.character(code(object))) {
                msg <- paste0("'code' slot must be a character string")
                return(msg)
              }
            }
)
