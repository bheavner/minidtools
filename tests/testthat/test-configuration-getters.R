context("test_configuration_getters - unit tests")

test_that("server(configuration) returns the expected string", {
  load("demo-config.rda")
  expect_identical(server(demo_config), "http://minid.bd2k.org/minid")
})

test_that("user(configuration)) returns the expected string", {
  load("demo-config.rda")
  expect_identical(user(demo_config), "Jane Smith")
  })

test_that("email(configuration)) returns the expected string", {
  load("demo-config.rda")
  expect_identical(email(demo_config), "jsmith@example.com")
})

test_that("orcid(configuration) returns the expected string", {
  load("demo-config.rda")
  expect_identical(orcid(demo_config), "0000-0003-2898-9044")
})

test_that("code(configuration) returns the expected string", {
  load("demo-config.rda")
  expect_identical(code(demo_config), "XXXX-XXX-XXXXX-XXXX-XXXX")
})
