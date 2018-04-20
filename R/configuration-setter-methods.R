#' @include AllClasses.R
#' @include AllGenerics.R
NULL

# slot setters -------------------------------
#' @describeIn server setter method for the server slot
#' @param value the new server URL
#' @import methods
setReplaceMethod("server", "configuration",
                 function(x, value) {
                   x@server <- value
                   validObject(x)
                   x
                   })

#' @describeIn user setter method for the user slot
#' @param value the new user string
#' @import methods
setReplaceMethod("user", "configuration",
                 function(x, value) {
                   x@user <- value
                   validObject(x)
                   x
                   })

#' @describeIn email setter method for the email slot
#' @param value the new email string
#' @import methods
setReplaceMethod("email", "configuration",
                 function(x, value) {
                   x@email <- value
                   validObject(x)
                   x
                   })

#' @describeIn orcid setter method for the orcid slot
#' @examples
#' \dontrun{
#' orcid(configuration_object) <- "0000-0003-2898-9044"
#' }
#' @import methods
setReplaceMethod("orcid", "configuration",
                 function(x, value) {
                   x@orcid <- value
                   validObject(x)
                   x
                   })

#' @describeIn code setter method for the code slot
#' @param value the new code string
#' @import methods
setReplaceMethod("code", "configuration",
                 function(x, value) {
                   x@code <- value
                   validObject(x)
                   x
                   })
