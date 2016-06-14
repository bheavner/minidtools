#-------------------------------------------------------------------------------
#' An S4 class to represent a minid.
#'
#' @slot id a character string containing the minid (e.g. ark:/99999/fk4mp58v5t)
#' @slot metadata a list of the metadata associated with the minid
#' @export

.minid <- setClass ("minid",
                    slots = list(id="character", metadata="list")
                    )

#-------------------------------------------------------------------------------
printf <- function(...) print(noquote(sprintf(...)))

#-------------------------------------------------------------------------------
#' The constructor function for making minid objects
#' 
#' @param id minid to resolve.
#' 
#' @return resolves the  an instance of the minid class
#' 
#' @examples
#' demo.id <- "ark:/99999/fk4mp58v5t"
#' demo.minid <- minid(demo.id)
#' 
#' @export
#' 
minid <- function(id) {
  landing.page.prefix <- "http://minid.bd2k.org/minid/landingpage/"
  full.url <- paste(landing.page.prefix, id, sep="")
  request.object  <- GET(full.url, add_headers(Accept="application/json"))
  text.response <- httr::content(request.object, "text", encoding="UTF-8");
  stopifnot(jsonlite::validate(text.response))
  minid.JSON <- jsonlite::fromJSON(text.response)
  .minid(id=id, metadata=minid.JSON)
} # minid, the constructor

#-------------------------------------------------------------------------------
#' Query S4 minid object metadata for minid creator
#' 
#' \code{getCreator} returns the creator from the minid metadata.
#' 
#' This is a generic function: methods can be defined for it.
#' 
#' @return The output is a character string
#' 
#' @examples
#' demo.id <- "ark:/99999/fk4mp58v5t"
#' demo.minid <- minid(demo.id)
#' getCreator(demo.minid)
#' 
#' @export

setGeneric("getCreator", signature="obj", function(obj) {
  standardGeneric("getCreator")
  })

#-------------------------------------------------------------------------------
setMethod("getCreator", "minid",
   function (obj){
      obj@metadata$creator
      })

#-------------------------------------------------------------------------------
