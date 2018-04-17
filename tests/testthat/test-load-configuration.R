context("test_load_configuration - unit tests")

test_that("load_configuration() returns the expected object", {
  config <- load_configuration(config_file = "minid-config.json",
                               section = "test")
  expect_identical(user(config), "Test User")
})
