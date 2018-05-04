context("test_minid_show - unit tests")

test_that("show(minid) prints expected output", {
  load("demo.rda")
  expected_regex <-
    paste0(
      "MINID:\n  ",
      "identifier = ark:/57799/b9j69h\n  ",
      "short_identifier = minid:b9j69h\n  ",
      "creator = mdarcy\n  ",
      "orcid = <id string>\n  ",
      "created = Mon, 19 Mar 2018 17:43:57 GMT\n  ",
      "checksum = 6484968f81afac84857d02b573b0d589fb2f9582a2b920572830dc578",
      "1e0a53c\n  ",
      "checksum_function = SHA\n  ",
      "status = ACTIVE\n  ",
      "locations = https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz",
      "\n    ",
      "(use locations(object) for more)\n  ",
      "titles = AGR Data set with identifier-based references todata in ",
      "cloud storage\n    ",
      "(use titles(object) for more)\n  ",
      "obsoleted_by = \n    ",
      "(use obsoleted_by(object) for more)\n  ",
      "content_key = "
    )
  expect_output(show(demo), regexp = expected_regex, fixed = TRUE)
})

context("test_configuration_show - unit tests")

test_that("show(configuration) prints expected output", {
  load("demo-config.rda")
  expected_regex <-
    paste0(
      "Configuration:\n  ",
      "server = http://minid.bd2k.org/minid\n  ",
      "user = Jane Smith\n  ",
      "email = jsmith@example.com\n  ",
      "orcid = 0000-0003-2898-9044\n  ",
      "code = XXXX-XXX-XXXXX-XXXX-XXXX"
    )
  expect_output(show(demo_config), regexp = expected_regex, fixed = TRUE)
})
