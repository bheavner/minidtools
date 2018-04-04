#' @include AllClasses.R
#' @include AllGenerics.R
#' @include AllConstructors.R
NULL

# slot getters -------------------------------
#' @describeIn identifier getter method for the identifier slot
#' @importFrom methods setMethod
setMethod("identifier", "minid", function(x) x@identifier)

#' @describeIn creator getter method for the creator slot
#' @importFrom methods setMethod
setMethod("creator", "minid", function(x) x@creator)

#' @describeIn created getter method for the created slot
#' @importFrom methods setMethod
setMethod("created", "minid", function(x) x@created)

#' @describeIn checksum getter method for the checksum slot
#' @importFrom methods setMethod
setMethod("checksum", "minid", function(x) x@checksum)

#' @describeIn checksum_function getter method for the checksum_function slot
#' @importFrom methods setMethod
setMethod("checksum_function", "minid", function(x) x@checksum_function)

#' @describeIn status getter method for the status slot
#' @importFrom methods setMethod
setMethod("status", "minid", function(x) x@status)

#' @describeIn locations getter method for the locations slot
#' @importFrom methods setMethod
setMethod("locations", "minid", function(x) x@locations)

#' @describeIn titles getter method for the titles slot
#' @importFrom methods setMethod
setMethod("titles", "minid", function(x) x@titles)
