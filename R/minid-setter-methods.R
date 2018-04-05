#' @include AllClasses.R
#' @include AllGenerics.R
NULL

# slot setters -------------------------------
#' @describeIn identifier setter method for the identifier slot
#' @param value the new identifier string
#' @import methods
setReplaceMethod("identifier", "minid",
                 function(x, value) {
                   x@identifier <- value
                   validObject(x)
                   x
                   })

#' @describeIn creator setter method for the creator slot
#' @param value the new creator string
#' @import methods
setReplaceMethod("creator", "minid",
                 function(x, value) {
                   x@creator <- value
                   validObject(x)
                   x
                   })

#' @describeIn created setter method for the created slot
#' @param value the new created string
#' @import methods
setReplaceMethod("created", "minid",
                 function(x, value) {
                   x@created <- value
                   validObject(x)
                   x
                   })

#' @describeIn checksum setter method for the checksum slot
#' @param value the new checksum string
#' @import methods
setReplaceMethod("checksum", "minid",
                 function(x, value) {
                   x@checksum <- value
                   validObject(x)
                   x
                   })

#' @describeIn checksum_function setter method for the checksum_function slot
#' @param value the new checksum_function string
#' @import methods
setReplaceMethod("checksum_function", "minid",
                 function(x, value) {
                   x@checksum_function <- value
                   validObject(x)
                   x
                   })

#' @describeIn status setter method for the status slot
#' @param value the new status string
#' @import methods
setReplaceMethod("status", "minid",
                 function(x, value) {
                   x@status <- value
                   validObject(x)
                   x
                   })

#' @describeIn locations setter method for the locations slot
#' @param value the new locations list
#' @import methods
setReplaceMethod("locations", "minid",
                 function(x, value) {
                   x@locations <- value
                   validObject(x)
                   x
                   })

#' @describeIn titles setter method for the titles slot
#' @param value the new titles list
#' @import methods
setReplaceMethod("titles", "minid",
                 function(x, value) {
                   x@titles <- value
                   validObject(x)
                   x
                   })

#' @describeIn obsoleted_by setter method for the obsoleted_by slot
#' @param value the new obsloleted_by list
#' @import methods
setReplaceMethod("obsoleted_by", "minid",
                 function(x, value) {
                   x@obsoleted_by <- value
                   validObject(x)
                   x
                   })

#' @describeIn content_key setter method for the content_key slot
#' @param value the new content_key string
#' @import methods
setReplaceMethod("content_key", "minid",
                 function(x, value) {
                   x@content_key <- value
                   validObject(x)
                   x
                   })
