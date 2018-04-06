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
