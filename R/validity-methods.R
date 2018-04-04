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
              if ( !(is.character(identifier(object)) |
                   is.null(identifier(object))) ) {
                return("'identifier' slot must be a character string or NULL")
              }
              if ( !is.character(creator(object)) ) {
                return("'creator' slot must be a character string")
              }
              if ( !is.character(created(object)) ) {
                return("'created' slot must be a character string")
              }
              if ( !(is.character(checksum(object)) |
                   is.null(checksum(object))) ) {
                return("'checksum' slot must be a character string or NULL")
              }
              if ( !(is.character(checksum_function(object)) |
                   is.null(checksum_function(object))) ) {
                msg <- paste0("'checksum_function' slot must be a character ",
                              "string or NULL")
                return(msg)
              }
              if ( !(is.character(status(object)) |
                   is.null(status(object))) ) { # add here
                return("'status' slot must be a character string or NULL")
              }
              if ( !is.list(locations(object)) ) { # add here
                msg <- paste0("'locations' slot must be a list")
                return(msg)
              }
              if ( !is.list(titles(object))) {
                msg <- paste0("'titles' slot must be a list")
                return(msg)
              }
              if ( !is.list(obsoleted_by(object)) ) {
                msg <- paste0("'obsoleted_by' slot must be a list")
                return(msg)
              }
              if ( !(is.character(content_key(object)) |
                   is.null(content_key(object))) ) { # add here
                return("'content_key' slot must be a character string or NULL")
              }
            }
)