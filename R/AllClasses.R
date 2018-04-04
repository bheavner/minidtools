#  minid class -------------------------------------------------------
#' minid-class
#' 
#' An S4 class to represent a minid.
#' 
#' @slot identifier a character string containing the minid 
#'   (e.g. ark:/99999/fk4mp58v5t)
#' @slot creator a character string giving the name (and, optionally, ORCID) of
#'   the person who registered the minid (e.g. "mdarcy (0000-0003-2280-917X)")
#' @slot created a character string giving the date and time the minid was 
#'   created (e.g. "Mon, 19 Mar 2018 17:43:57 GMT")
#' @slot checksum the checksum of the identified digital object (e.g. 
#'   "6484968f81afac84857d02b573b0d589fb2f9582a2b920572830dc5781e0a53c")
#' @slot checksum_function the hashing function used to calculate the checksum 
#'   (e.g. "SHA")
#' @slot status The minid status (e.g. "ACTIVE" or "MOTHBALLED")
#' @slot locations A list of locations hostingthe identified digital object 
#'   (e.g. "mdarcy - https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz")
#' @slot titles A list of titles for the identified digital object (e.g.
#'   "mdarcy - AGR Data set with identifier-based references to data in cloud 
#'   storage"
#' @slot obsoleted_by For minids that have "MOTHBALLED" status, a list of minids
#'   superceding the mothballed minid
#' @slot content_key a character string used for the hash of a bdbag
#'   
#' @section see also:
#' \code{?\link{minid}}
#' 
#' @import methods
#'
#' @export
setClass("minid",
         slots = c(
           identifier = "character",
           checksum = "character",
           titles = "list",
           locations = "list",
           status = "character",
           obsoleted_by = "list",
           content_key = "character",
           creator = "character",
           created = "character",
           checksum_function = "character"
         ))
