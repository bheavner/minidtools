#' @include AllClasses.R
#' @include AllGenerics.R
NULL

# slot getters -------------------------------
#' @describeIn identifier getter method for the identifier slot
#' @import methods
setMethod("identifier", "minid", function(x) x@identifier)

#' @describeIn creator getter method for the creator slot
#' @import methods
setMethod("creator", "minid", function(x) x@creator)

#' @describeIn created getter method for the created slot
#' @import methods
setMethod("created", "minid", function(x) x@created)

#' @describeIn checksum getter method for the checksum slot
#' @import methods
setMethod("checksum", "minid", function(x) x@checksum)

#' @describeIn status getter method for the status slot
#' @import methods
setMethod("status", "minid", function(x) x@status)

#' @describeIn locations getter method for the locations slot
#' @import methods
setMethod("locations", "minid", function(x) x@locations)

#' @describeIn titles getter method for the titles slot
#' @import methods
setMethod("titles", "minid", function(x) x@titles)
