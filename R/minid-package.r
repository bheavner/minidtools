#' A package for querying BDDS minids.
#' 
#' the \pkg{minid} package allows you to qury minids in R.
#' 
#' \pkg{minid} includes functions for creating a minid object by resolving
#' minids. With this object, users can query the metadata associated with an
#' identifier or retreive a data object from the location given by the minid.
#' 
#' \pkg{minid} does not currently support minting new minids
#' 
#' @examples
#' demo.id <- "ark:/99999/fk4mp58v5t"
#' demo.minid <- minid(demo.id)
#' getCreator(demo.minid)
#' 
#' @references \url{http://http://minid.bd2k.org/}
#'   
"_PACKAGE"
#> [1] "_PACKAGE"
