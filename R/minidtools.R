# a place for package documentation and some general utility functions

# package documentatioon --------------

#' minidtools: An R package for interacting with MINimal viable IDentifiers.
#'
#' The \pkg{minidtools} package provides three categories of tools for working
#'   with minids:
#' user registry, querying minids, and creating minids.
#' 
#' @section user registry:
#' The user registry functions ...
#' 
#' @section querying minids:
#' \code{\link{identifier}} get the minid identifier
#' 
#' \code{\link{creator}} get the minid creator
#' 
#' \code{\link{created}} get the minid creation date
#' 
#' \code{\link{checksum}} get the minid checksum
#' 
#' \code{\link{checksum_function}} get the minid checksum hashing function
#' 
#' \code{\link{status}} get the minid status
#' 
#' \code{\link{locations}} get the minid locations
#' 
#' \code{\link{titles}} get the minid titles
#' 
#' @section creating minids:
#' The minid minting functions ...
#' 
#' @section see also:
#' \code{?`\linkS4class{minid}`}
#' 
#' @references \url{http://minid.bd2k.org/}
#'
#' @docType package
#' @name minidtools
NULL

# make minid example for documentation------------
#' @noRd
.make_demo <- function(){
  demo <- minid(
    identifier = "ark:/57799/b9j69h",
    creator = "mdarcy (0000-0003-2280-917X)",
    created = "Mon, 19 Mar 2018 17:43:57 GMT",
    checksum = paste0("6484968f81afac84857d02b573b0d589fb2f9582a2b920572830dc",
                      "5781e0a53c"),
    checksum_function = "SHA",
    status = "ACTIVE",
    locations = list(
      "https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz"),
    titles = list(paste0("AGR Data set with identifier-based references to",
                         "data in cloud storage")),
    obsoleted_by = NULL,
    content_key = NULL
  )
  devtools::use_data(demo, overwrite = TRUE)
}

# data documentation----------------------------
#' Demo minid.
#'
#' A R object of class minid, useful for demos and testing.
#'
#' @format A minid, with filled slots.
"demo"
