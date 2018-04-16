context("test_configuration_setters - unit tests")

test_that('server(demo_config) <- "foo" works', {
  load("demo-config.rda")
  server(demo_config) <- "foo"
  expect_identical(server(demo_config), "foo")
})

test_that('user(demo_config) <- "foo" works', {
  load("demo-config.rda")
  user(demo_config) <- "foo"
  expect_identical(user(demo_config), "foo")
})

test_that('email(demo_config) <- "foo" works', {
  load("demo-config.rda")
  email(demo_config) <- "foo"
  expect_identical(email(demo_config), "foo")
})

test_that('orcid(demo_config) <- "foo" works', {
  load("demo-config.rda")
  orcid(demo_config) <- "foo"
  expect_identical(orcid(demo_config), "foo")
})

test_that('code(demo_config) <- "foo" works', {
  load("demo-config.rda")
  code(demo_config) <- "foo"
  expect_identical(code(demo_config), "foo")
})
