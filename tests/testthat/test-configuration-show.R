context("test_configuration_show - unit tests")

test_that("show(configuration) prints expected output", {
  load("demo-config.rda")
  expected_regex <-
    paste0(
      "Configuration:\n  ",
      "server = http://minid.bd2k.org/\n  ",
      "user = Jane Smith\n  ",
      "email = jsmith@example.com\n  ",
      "orcid = 0000-0003-2898-9044\n  ",
      "code = XXXX-XXX-XXXXX-XXXX-XXXX"
    )
  expect_output(show(demo_config), regexp = expected_regex, fixed = TRUE)
})
