#' @include AllClasses.R
#' @include AllGenerics.R
NULL

#  minid constructor -----------------------------------------
#' Create an instance of the minid class
#'
#' @param identifier a character string containing the minid
#'   (e.g. ark:/99999/fk4mp58v5t)
#' @param short_identifier a character string containing the short minid
#'   (e.g. "minid:fk4mp58v5t")
#' @param creator a character string giving the name of the person who
#'   registered the minid (e.g. "mdarcy").
#' @param orcid a character string giving the ORCid of the person who registered
#'   the minid (e.g. "0000-0003-2280-917X")
#' @param created a character string giving the date and time the minid was
#'   created (e.g. "Mon, 19 Mar 2018 17:43:57 GMT")
#' @param checksum the checksum of the identified digital object (e.g.
#'   "6484968f81afac84857d02b573b0d589fb2f9582a2b920572830dc5781e0a53c")
#' @param checksum_function the hashing function used to calculate the checksum
#'   (e.g. "SHA")
#' @param status The minid status (e.g. "ACTIVE" or "MOTHBALLED"). Note: may be
#'   NULL
#' @param locations A list of named lists containing locations hosting the
#'   identified digital object (e.g. locations[[1]]$created = "Mon, 19 Mar 2018
#'   17:43:57 GMT", locations[[1]]$creator = "mdarcy", locations[[1]]$link =
#'   "https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz"),
#'   locations[[1]]$uri =
#'   "https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz").
#' @param titles A list of named lists containing titles for the identified
#'   digital object (e.g. titles[[1]]$creator = "mdarcy", titles[[1]]$created =
#'   "Mon, 19 Mar 2018 17:43:57 GMT", titles[[1]]$title = "AGR Data set with
#'   identifier-based references to data in cloud storage"
#' @param obsoleted_by For minids that have "MOTHBALLED" status, a list of
#'   minids superceding the mothballed minid.
#' @param content_key a character string, used for the hash of a bdbag.
#'
#' @return an instance of the minid class
#'
#' @examples
#' \dontrun{
#' test_minid <- minid(
#'  identifier = "ark:/57799/b9j69h",
#'  short_identifier = "minid:fk4mp58v5t",
#'  creator = "mdarcy",
#'  orcid =  "0000-0003-2280-917X",
#'  created = "Mon, 19 Mar 2018 17:43:57 GMT",
#'  checksum = paste0("6484968f81afac84857d02b573b0d589fb2f9582a2b920572830dc",
#'                    "5781e0a53c"),
#'  checksum_function = "SHA",
#'  status = "ACTIVE",
#'  locations = list(
#'    list(created = "Mon, 19 Mar 2018 17:43:57 GMT",
#'      creator = "mdarcy",
#'      link =
#'       "https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz",
#'      uri =
#'       "https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz")),
#'  titles = list(
#'    list(created = "Mon, 19 Mar 2018 17:43:57 GMT",
#'      creator = "mdarcy",
#'      title = paste0("AGR Data set with identifier-based references to",
#'                       "data in cloud storage")),
#'  obsoleted_by = list(NULL),
#'  content_key = as.character(NULL)
#' )
#' }
#'
#' @import methods
#' @export
minid <-
  function(identifier = vector(mode = "character"),
           short_identifier = vector(mode = "character"),
           creator = vector(mode = "character"),
           orcid = vector(mode = "character"),
           created = vector(mode = "character"),
           checksum = vector(mode = "character"),
           checksum_function = vector(mode = "character"),
           status = vector(mode = "character"),
           locations = vector(mode = "list"),
           titles = vector(mode = "list"),
           obsoleted_by = vector(mode = "list"),
           content_key = vector(mode = "character")) {
    new("minid",
        identifier = identifier,
        short_identifier = short_identifier,
        creator = creator,
        orcid = orcid,
        created = created,
        checksum = checksum,
        checksum_function = checksum_function,
        status = status,
        locations = locations,
        titles = titles,
        obsoleted_by = obsoleted_by,
        content_key = content_key)
  }


#  configuration constructor -----------------------------------------
#' Create an instance of the configuration class
#'
#' @param server a character string containing the minid server URL
#'   (e.g. http://minid.bd2k.org/minid)
#' @param user a character string containing the user name (e.g. "Jane Smith")
#' @param email email address for minid user
#' @param orcid the user's ORCID - see https://orcid.org/ (e.g.
#'   "0000-0003-2898-9044")
#' @param code the unique code sent when email address was validated
#'
#' @return an instance of the configuration class
#'
#' @examples
#' \dontrun{
#' example_configuration <- configuration(
#'              server = "http://minid.bd2k.org/minid",
#'              user = "Jane Smith",
#'              email = "jsmith@example.com",
#'              orcid = "0000-0003-2898-9044",
#'              code = "XXXX-XXX-XXXXX-XXXX-XXXX"
#' )
#' }
#'
#' @import methods
#' @export
configuration <-
  function(server = "http://minid.bd2k.org/minid",
           user = vector(mode = "character"),
           email = vector(mode = "character"),
           orcid = vector(mode = "character"),
           code = vector(mode = "character")) {
    new("configuration",
        server = server,
        user = user,
        email = email,
        orcid = orcid,
        code = code)
  }
