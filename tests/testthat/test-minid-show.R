context("test_minid_show - unit tests")

test_that("show(minid) prints expected output", {
  load("demo.rda")
  expected_regex <-
    paste0(
      "MINID:\n  identifier = ark:/57799/b9j69h\n  ",
      "creator = mdarcy (<id string>)\n  ",
      "created = Mon, 19 Mar 2018 17:43:57 GMT\n  ",
      "checksum = ",
      "6484968f81afac84857d02b573b0d589fb2f9582a2b920572830dc5781e0a53c\n  ",
      "checksum_function = SHA\n  ",
      "status = ACTIVE\n  ",
      "locations = mdarcy - ",
      "https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz\n  ",
      "titles = mdarcy - AGR Data set with identifier-based references to ",
      "data in cloud storage\n  ",
      "obsoleted_by = \n  ",
      "content_key = "
    )
  expect_output(show(demo), regexp = expected_regex, fixed = TRUE)
})
