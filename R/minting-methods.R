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
            location <-
              ifelse(get_location(minid) == "", "none", get_location(minid))
            body <- list()
            if (test){
              body <-
                append(
                  body,
                  list(test = stringr::str_to_title(as.character(test)))
                  )
            }
            body <-
              append(
                body,
                list(
                  checksum_function = checksum_function(minid),
                  checksum = checksum(minid),
                  email = email(configuration),
                  code = code(configuration),
                  title = get_title(minid),
                  locations = list(location)
                )
              )

            # set user agent
            ua <- httr::user_agent("https://github.com/bheavner/minidtools")

            # send request - use htttr::with_verbose() to debug
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

            # new minid
            lookup(parsed$identifier)
          })

#' @describeIn mint mint a new minid from two named lists
#' @import methods
setMethod("mint", signature = c("list", "list"),
          function(minid, configuration, test) {
            url <- server(configuration)
            location <-
              ifelse(minid$location == "", "none", minid$location)
            body <- list(
              test = stringr::str_to_title(as.character(test)),
              checksum_function = minid$checksum_function,
              checksum = minid$checksum,
              email = configuration$email,
              code = configuration$code,
              title = minid$title,
              locations = list(location)
            )

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

            # new minid
            lookup(parsed$identifier)
          })

#' @describeIn mint mint a new minid from a minid and named list
#' @import methods
setMethod("mint", signature = c("minid", "list"),
          function(minid, configuration, test) {
            url <- server(configuration)
            location <-
              ifelse(get_location(minid) == "", "none", get_location(minid))
            body <- list(
              test = stringr::str_to_title(as.character(test)),
              checksum_function = checksum_function(minid),
              checksum = checksum(minid),
              email = configuration$email,
              code = configuration$code,
              title = get_title(minid),
              locations = list(location)
            )

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

            # new minid
            lookup(parsed$identifier)

          })

#' @describeIn mint mint a new minid from a named list and configuration object
#' @import methods
setMethod("mint", signature = c("list", "configuration"),
          function(minid, configuration, test) {
            url <- server(configuration)
            location <-
              ifelse(minid$location == "", "none", minid$location)
            body <- list(
              test = stringr::str_to_title(as.character(test)),
              checksum_function = minid$checksum_function,
              checksum = minid$checksum,
              email = email(configuration),
              code = code(configuration),
              title = minid$title,
              locations = list(location)
            )

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

            # new minid
            lookup(parsed$identifier)

          })


#' @describeIn mint mint a new minid from a file path and configuration object
#' @import methods
setMethod("mint", signature = c("character", "configuration"),
          function(minid, configuration, test) {
            if (! file.exists(minid)) {
              stop("First arguement should be a file path - file does not
                   exist")
            }

            url <- server(configuration)

            body <- list(
              test = stringr::str_to_title(as.character(test)),
              checksum_function = "sha256",
              checksum = digest::digest(minid, file = TRUE, algo = "sha256"),
              email = email(configuration),
              code = code(configuration),
              title = basename(minid),
              locations = list(paste0("file:", minid))
            )

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

            # new minid
            lookup(parsed$identifier)

          })
