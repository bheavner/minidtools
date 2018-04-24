#' @include AllClasses.R
#' @include AllGenerics.R
#' @include AllConstructors.R
NULL

# location ----------------------
#' @describeIn get_location return the nth location from a minid object
#' @import methods
setMethod("get_location", "minid",
          function(minid, n = 1, server = NULL) {
            if (status(minid) == "TOMBSTONE") {
              message('This minid has status "TOMBSTONE"')
            }
            locations(minid)[[n]]$link
            }
          )

#' @describeIn get_location do lookup() on minid string and return nth location
#' @import methods
setMethod("get_location", "character",
          function(minid, n = 1, server = "http://minid.bd2k.org/minid") {
            if (!(stringr::str_detect(minid, "(^ark)|(^minid)"))) {
              msg <- paste0("query must be a minid of the form ",
                            '"ark:/57799/b9j69h" or "minid:b9j69h"')
              stop(msg)
            }
            resolved <- lookup(query = minid, server = server)
            if (status(resolved) == "TOMBSTONE") {
              message('This minid has status "TOMBSTONE"')
            }
            locations(resolved)[[n]]$link
          }
)

# newer ---------------------------------
#' @describeIn get_newer return the nth entry of obsoleted_by minid field. If
#'   minid status = ACTIVE, returns minid identifier.
#' @import methods
setMethod("get_newer", "minid",
          function(minid, n = 1, server = NULL) {
            if (status(minid) == "ACTIVE") {
              return(identifier(minid))
            } else if (status(minid) == "TOMBSTONE") {
              return(obsoleted_by(minid)[[n]])
            } else {
              stop("Unknown minid status.")
            }
          }
)

#' @describeIn get_newer do lookup() on minid string and return nth entry of
#'   obsoleted_by minid field. If minid status = ACTIVE, returns minid
#'   identifier
#'
#' @import methods
setMethod("get_newer", "character",
          function(minid, n = 1, server = "http://minid.bd2k.org/minid") {
            if (!(stringr::str_detect(minid, "(^ark)|(^minid)"))) {
              msg <- paste0("query must be a minid of the form ",
                            '"ark:/57799/b9j69h" or "minid:b9j69h"')
              stop(msg)
            }
            resolved <- lookup(query = minid, server = server)
            if (status(resolved) == "ACTIVE") {
              return(identifier(resolved))
            } else if (status(resolved) == "TOMBSTONE") {
              return(obsoleted_by(resolved)[[n]])
            } else {
              stop("Unknown minid status.")
            }
          }
)

# title ----------------------
#' @describeIn get_title return the nth title from a minid object
#' @import methods
setMethod("get_title", "minid",
          function(minid, n = 1, server = NULL) {
            if (status(minid) == "TOMBSTONE") {
              message('This minid has status "TOMBSTONE"')
            }
            titles(minid)[[n]]$title
          }
)

#' @describeIn get_title do lookup() on minid string and return nth title
#' @import methods
setMethod("get_title", "character",
          function(minid, n = 1, server = "http://minid.bd2k.org/minid") {
            if (!(stringr::str_detect(minid, "(^ark)|(^minid)"))) {
              msg <- paste0("query must be a minid of the form ",
                            '"ark:/57799/b9j69h" or "minid:b9j69h"')
              stop(msg)
            }
            resolved <- lookup(query = minid, server = server)
            if (status(resolved) == "TOMBSTONE") {
              message('This minid has status "TOMBSTONE"')
            }
            titles(resolved)[[n]]$title
          }
)
