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

# data documentation----------------------------
#' Demo minid.
#'
#' A R object of class minid, useful for demos and testing.
#'
#' @format A minid, with filled slots.
"demo2"
