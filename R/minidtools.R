# a place for package documentation and some general utility functions

# package documentatioon --------------

#' minidtools: An R package for interacting with minids, the MINimal viable 
#'   IDentifier.
#'
#' The \pkg{minidtools} package provides three categories of tools for working
#'   with minids:
#' user registry, querying minids, and creating minids.
#' 
#' @section user registry:
#' The foo functions ...
#' 
#' @section querying minids:
#' 
#' @section creating minids:
#' 
#' @references \url{http://http://minid.bd2k.org/}
#'
#' @docType package
#' @name minidtools
NULL

# data documentation----------------------------
#' Demo minid.
#'
#' A R object of class minid, useful for demos and testing.
#'
#' @format A minid, with filled slots:
"demo"


# helpful utility functions --------------------
#' Get path to load minidtools examples
#'
#' \pkg{minidtools} comes bundled with sample files in its \code{inst/extdata}
#' diretory. This function makes them easier to access. Based on
#' \code{readr::readr_example()}
#'
#' @param filename Name of file
#'
#' @examples
#' minid_example(filename = "demo.rda")
#'
#' @export
minid_example <- function(filename) {
  system.file("data", filename, package = "minidtools", mustWork = TRUE)
}
