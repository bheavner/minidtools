#' @include AllClasses.R
#' @include AllGenerics.R
NULL

#  minid constructor -----------------------------------------
#' Create an instance of the minid class
#' 
#' @param identifier a character string containing the minid 
#'   (e.g. ark:/99999/fk4mp58v5t) Note: may be NULL
#' @param creator a character string giving the name (and and optionally, ORCID)
#'   of the person who registered the minid (e.g. "mdarcy 
#'   (0000-0003-2280-917X)"). Note: may be NULL
#' @param created a character string giving the date and time the minid was 
#'   created (e.g. "Mon, 19 Mar 2018 17:43:57 GMT") Note: may be NULL
#' @param checksum the checksum of the identified digital object (e.g. 
#'   "6484968f81afac84857d02b573b0d589fb2f9582a2b920572830dc5781e0a53c")
#' @param checksum_function the hashing function used to calculate the checksum 
#'   (e.g. "SHA")
#' @param status The minid status (e.g. "ACTIVE" or "MOTHBALLED"). Note: may be
#'   NULL
#' @param locations A list of locations hostingthe identified digital object. 
#'   (e.g. "mdarcy - 
#'   https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz"). Note: may be
#'   NULL
#' @param titles A list of titles for the identified digital object (e.g.
#'   "mdarcy - AGR Data set with identifier-based references to data in cloud 
#'   storage"
#' @param obsoleted_by For minids that have "MOTHBALLED" status, a list of
#'   minids superceding the mothballed minid. Note: may be NULL
#' @param content_key a character string, used for the hash of a bdbag. Note:
#'   may be NULL
#' 
#' @return an instance of the minid class
#' 
#' @examples
#' #' \dontrun{
#' test_minid <- minid(
#'  identifier = "ark:/57799/b9j69h",
#'  creator = "mdarcy (0000-0003-2280-917X)",
#'  created = "Mon, 19 Mar 2018 17:43:57 GMT",
#'  checksum = paste0("6484968f81afac84857d02b573b0d589fb2f9582a2b920572830dc",
#'                    "5781e0a53c"),
#'  checksum_function = "SHA",
#'  status = "ACTIVE",
#'  locations = list(
#'    "https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz"),
#'  titles = list(paste0("AGR Data set with identifier-based references to",
#'                       "data in cloud storage")),
#'  obsoleted_by = list(NULL),
#'  content_key = as.character(NULL)
#' )
#' }
#' 
#' @import methods
#' @export
minid <- 
  function(identifier = NULL, creator = NULL, created = NULL, checksum,
           checksum_function, status = NULL, locations = NULL, titles,
           obsoleted_by = list(NULL), content_key = as.character(NULL)) {
    new("minid",
        identifier = identifier,
        creator = creator,
        created = created,
        checksum = checksum,
        checksum_function = checksum_function,
        status = status,
        locations = locations,
        titles = titles,
        obsoleted_by = obsoleted_by,
        content_key = content_key)
  }