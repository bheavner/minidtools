context("test_minid_constructor - unit tests")

test_that("minid() makes an object with class minid", {
  test_minid <-
  minid(
    identifier = "ark:/57799/b9j69h",
    creator = "mdarcy (<id string>)",
    created = "Mon, 19 Mar 2018 17:43:57 GMT",
    checksum = paste0("6484968f81afac84857d02b573b0d589fb2f9582a2b920572830dc",
                      "5781e0a53c"),
    checksum_function = "SHA",
    status = "ACTIVE",
    locations = list(
      "mdarcy - https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz"),
    titles = list(paste0("mdarcy - AGR Data set with identifier-based ",
                         "references to data in cloud storage"))
  )
  expect_identical(is(test_minid), "minid")
})
