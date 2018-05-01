#' @include AllClasses.R
#' @include AllGenerics.R
#' @include AllConstructors.R
NULL

# mint ----------------------
#' @describeIn mint mint a new minid from a minid object
#' @import methods
setMethod("mint", signature = c("minid", "configuration"),
          function(minid, configuration, test) {
            url <- server(configuration)
            body <- list(
              test = stringr::str_to_title(as.character(test)),
              checksum_function = checksum_function(minid),
              checksum = checksum(minid),
              email = email(configuration),
              code = code(configuration),
              title = get_title(minid),
              locations = list(get_location(minid))
            )
            browser()

            # set user agent
            ua <- httr::user_agent("https://github.com/bheavner/minidtools")

            # send request
            resp <- httr::POST(url, body = body, ua, encode = "json")

            # check for JSON response
            if (httr::http_type(resp) != "application/json") {
              stop("API did not return json", call. = FALSE)
            }

            # parse json
            parsed <- jsonlite::fromJSON(
              httr::content(resp, "text", encoding = "UTF-8"),
                                         simplifyVector = FALSE)

            # catch errors
            if (httr::http_error(resp)) {
              stop(
                sprintf(
                  "BD2K minid API request failed [%s]\n%s\n<%s>",
                  httr::status_code(resp),
                  parsed$message,
                  parsed$documentation_url
                ),
                call. = FALSE
              )
            }

            # look up and return new minid
            lookup(parsed$identifier)
          })
