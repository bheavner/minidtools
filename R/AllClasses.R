#  minid class -------------------------------------------------------
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

#' @import methods
#' @export
setClass("minid",
         slots = c(
           identifier = "character",
           creator = "character",
           created = "character",
           checksum = "character",
           checksum_function = "character",
           status = "character",
           locations = "list",
           titles = "list"
         ))

#  minid constructor -----------------------------------------
#' The constructor function for making minid objects
#' 
#' @param identifier a character string containing the minid 
#'   (e.g. ark:/99999/fk4mp58v5t) Note: may be NULL
#' @param creator a character string giving the name (and and optionally, ORCID)
#'   of the person who registered the minid (e.g. "mdarcy 
#'   (0000-0003-2280-917X)")
#' @param created a character string giving the date and time the minid was 
#'   created (e.g. "Mon, 19 Mar 2018 17:43:57 GMT") Note: may be NULL
#' @param checksum the checksum of the identified digital object (e.g. 
#'   "6484968f81afac84857d02b573b0d589fb2f9582a2b920572830dc5781e0a53c")
#' @param checksum_function the hashing function used to calculate the checksum 
#'   (e.g. "SHA")
#' @param status The minid status (e.g. "ACTIVE" or "MOTHBALLED")
#' @param locations A list of locations hostingthe identified digital object 
#'   (e.g. "mdarcy - https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz")
#' @param titles A list of titles for the identified digital object (e.g.
#'   "mdarcy - AGR Data set with identifier-based references to data in cloud 
#'   storage"
#' 
#' @return resolves the  an instance of the minid class
#' 
#' @examples
#' test_minid <-minid(
#'  identifier = "ark:/57799/b9j69h",
#'  creator = "mdarcy (0000-0003-2280-917X)",
#'  created = "Mon, 19 Mar 2018 17:43:57 GMT",
#'  checksum = paste0("6484968f81afac84857d02b573b0d589fb2f9582a2b920572830dc",
#'                    "5781e0a53c"),
#'  status = "ACTIVE",
#'  locations = list(
#'    "https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz"),
#'  titles = list(paste0("AGR Data set with identifier-based references to",
#'                       "data in cloud storage"))
#' )
#' 
#' @import methods
#' @export
minid <- function(identifier = NULL, creator, created, checksum,
                  checksum_function, status, locations, titles) {
  methods::new("minid",
               identifier = identifier,
               creator = creator,
               created = created,
               checksum = checksum,
               status = status,
               locations = locations,
               titles = titles)
}
