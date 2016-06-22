#' A package for working with BDDS minids.
#' 
#' The \pkg{minid} package curretly includes functions resolving a minid and accessing the
#' associated metadata.
#' 
#' The \pkg{minid} package does not yet support minting new minids
#' 
"_PACKAGE"

#-------------------------------------------------------------------------------
#' An S4 class for minids.
#'
#' @slot identifier the identifier (a character string, e.g. ark:/99999/fk4mp58v5t)
#' @slot created timestamp the identifier was minted (a character string, e.g. 2016-04-05 16:19:07.331338)
#' @slot creator the name and ORCid identifier of the minid creator (a character string, e.g. Jane Researcher (0000-0003-2898-9044))
#' @slot checksum the identifier checksum (a character string, e.g. TEST-49a38ef920d6e55714d43b065df75870c2d0853fc5bce405609fcf9ef38090d5)
#' @slot status the identifier's status. (optional, may be blank, ACTIVE, or TOMBSTONE)
#' @slot locations locations associated with the identifier (optional list)
#' @slot titles titles assocaited the identifier (optional list)
#' 
#' @examples
#' getSlots("minid")

minid <- setClass ("minid",
                    slots = list(identifier="character", created="character",
                                 creator="character", checksum="character", 
                                 status="character", locations="character",
                                 titles="character")
                    ) #.minid, the class

# #-------------------------------------------------------------------------------
# printf <- function(...) print(noquote(sprintf(...)))
# 
# #-------------------------------------------------------------------------------
# #' minid
# #' 
# #' The constructor function for making minid objects
# #' 
# #' @export
# #' @param id minid to resolve.
# #' @return resolves the  an instance of the minid class
# #' @examples
# #' demo.id <- "ark:/99999/fk4mp58v5t"
# #' demo.minid <- minid(demo.id)
# 
# minid <- function(id) {
#   landing.page.prefix <- "http://minid.bd2k.org/minid/landingpage/"
#   full.url <- paste(landing.page.prefix, id, sep="")
#   request.object  <- httr::GET(full.url, add_headers(Accept="application/json"))
#   text.response <- httr::content(request.object, "text", encoding="UTF-8");
#   stopifnot(jsonlite::validate(text.response))
#   minid.JSON <- jsonlite::fromJSON(text.response)
#   .minid(id=id, metadata=minid.JSON)
# } # minid, the constructor
# 
# #-------------------------------------------------------------------------------
# #' Query S4 minid object metadata for minid creator
# #' 
# #' \code{getCreator} returns the creator from the minid metadata.
# #' 
# #' This is a generic function: methods can be defined for it.
# #' 
# #' @return The output is a character string
# #' 
# #' @examples
# #' demo.id <- "ark:/99999/fk4mp58v5t"
# #' demo.minid <- minid(demo.id)
# #' getCreator(demo.minid)
# #' 
# #' @export
# 
# setGeneric("getCreator", signature="obj", function(obj) {
#   standardGeneric("getCreator")
#   })
# 
# #-------------------------------------------------------------------------------
# setMethod("getCreator", "minid",
#    function (obj){
#       obj@metadata$creator
#       })
# 
#-------------------------------------------------------------------------------
