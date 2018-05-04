context("test_minid_constructor - unit tests")

test_that("minid() makes an object with class minid", {
  test_minid <-
    minid(
      identifier = "ark:/57799/b9j69h",
      short_identifier = "minid:b9j69h",
      creator = "mdarcy",
      orcid = "<id string>",
      created = "Mon, 19 Mar 2018 17:43:57 GMT",
      checksum = paste0("6484968f81afac84857d02b573b0d589fb2f9582a2b92057283",
                        "0dc5781e0a53c"),
      checksum_function = "SHA",
      status = "ACTIVE",
      locations = list(
        list(created = "Mon, 19 Mar 2018 17:43:57 GMT",
             creator = "mdarcy",
             link = "https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz",
             uri =
               "https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz")),
      titles = list(
        list(created = "Mon, 19 Mar 2018 17:43:57 GMT",
             creator = "mdarcy",
             title = paste0("AGR Data set with identifier-based references to",
                            "data in cloud storage"))),
      obsoleted_by = list(NULL),
      content_key = as.character(NULL)
    )
  expect_identical(is(test_minid), "minid")
})

context("test_configuration_constructor - unit tests")

test_that("configuration() makes an object with class configuration", {
  test_configuration <-
    configuration(
      server = "http://minid.bd2k.org/minid",
      user = "Jane Smith",
      email = "jsmith@example.com",
      orcid = "0000-0003-2898-9044",
      code = "XXXX-XXX-XXXXX-XXXX-XXXX"
    )
  expect_identical(is(test_configuration), "configuration")
})
