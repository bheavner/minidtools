#' @include AllClasses.R
#' @include AllGenerics.R
#' @include AllConstructors.R
NULL

#' @describeIn content_key getter method for the content_key slot
#' @import methods
setMethod("lookup",
          signature = "character",
          function(x) {
            # If I want to use the minid bd2k client,
            # get x to look like this: x <- "ark:/57799/b9j69h"
            # then:
            landing_page_prefix <- "http://minid.bd2k.org/minid/landingpage/"
            full_url <- paste0(landing_page_prefix, x)
            request_object  <-
              httr::GET(full_url,
                        httr::add_headers(Accept = "application/json"))
            text_response <-
              httr::content(request_object, "text", encoding = "UTF-8");
            stopifnot(jsonlite::validate(text_response))
            minid_JSON <- jsonlite::fromJSON(text_response)

            # HERE'S A HACK
            if (is.null(minid_JSON$obsoleted_by)) {
              obsoleted <- list()
            } else {
              obsoleted <- list(minid_JSON$obsoleted_by)
            }

            # HERE'S A HACK
            if (is.null(minid_JSON$content_key)) {
              content_key <- vector(mode = "character")
            } else {
              content_key <- minid_JSON$content_key
            }

            # AND... HERE'S A HACK
            minid(identifier = minid_JSON$identifier,
                  creator = minid_JSON$creator,
                  created = minid_JSON$created,
                  checksum = minid_JSON$checksum,
                  checksum_function = minid_JSON$checksum_function,
                  status = minid_JSON$status,
                  locations = list(minid_JSON$locations[[3]]), # clean up
                  titles = list(minid_JSON$titles[[3]]), # clean up
                  obsoleted_by = obsoleted, # should be list or NULL
                  content_key = content_key) # should be character
          })
