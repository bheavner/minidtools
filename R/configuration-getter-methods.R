#' @include AllClasses.R
#' @include AllGenerics.R
#' @include AllConstructors.R
NULL

# slot getters -------------------------------
#' @describeIn server getter method for the server slot
#' @import methods
setMethod("server", "configuration", function(x) x@server)

#' @describeIn user getter method for the user slot
#' @import methods
setMethod("user", "configuration", function(x) x@user)

#' @describeIn email getter method for the email slot
#' @import methods
setMethod("email", "configuration", function(x) x@email)

#' @describeIn orcid getter method for the orcid slot
#' @import methods
setMethod("orcid", "configuration", function(x) x@orcid)

#' @describeIn code getter method for the code slot
#' @import methods
setMethod("code", "configuration", function(x) x@code)
