#' @include AllClasses.R
#' @include AllGenerics.R
#' @include AllConstructors.R
NULL

# location ----------------------
#' @describeIn location return the nth location from a minid object
#' @import methods
setMethod("location", "minid",
          function(minid, n = 1, server = NULL) {
            if (status(minid) == "TOMBSTONE") {
              message('This minid has status "TOMBSTONE"')
            }
            locations(minid)[[n]]$link
            }
          )

#' @describeIn location do lookup() on minid string and return nth location
#' @import methods
setMethod("location", "character",
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
#' @describeIn newer return the nth entry of obsoleted_by minid field. If minid
#'   status = ACTIVE, returns minid identifier.
#' @import methods
setMethod("newer", "minid",
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

#' @describeIn newer do lookup() on minid string and return nth entry of
#'   obsoleted_by minid field. If minid status = ACTIVE, returns minid
#'   identifier
#'
#' @import methods
setMethod("newer", "character",
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
#' @describeIn title return the nth title from a minid object
#' @import methods
setMethod("title", "minid",
          function(minid, n = 1, server = NULL) {
            if (status(minid) == "TOMBSTONE") {
              message('This minid has status "TOMBSTONE"')
            }
            titles(minid)[[n]]$title
          }
)

#' @describeIn location do lookup() on minid string and return nth location
#' @import methods
setMethod("title", "character",
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
