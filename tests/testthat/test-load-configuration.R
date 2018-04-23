context("test_load_configuration - unit tests")

test_that("load_configuration() returns the expected object from JSON", {
  config <- load_configuration(config_file = "minid-config.json")
  expect_identical(user(config), "Jane Smith")
})

test_that("load_configuration() works with python config", {
  config <- load_configuration(config_file = "minid-config.cfg")
  expect_identical(user(config), "Jane Smith")
})