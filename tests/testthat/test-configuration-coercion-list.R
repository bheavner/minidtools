context("test_configuration_coercion to list - unit tests")

test_that("as.list(configuration) returns a list", {
  load("demo-config.rda")
  expect_true(is.list(as.list(demo_config)))
})
