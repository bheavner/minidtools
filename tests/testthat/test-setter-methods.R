context("test_minid_setters - unit tests")

test_that('identifier(demo) <- "foo" works', {
  load("demo.rda")
  identifier(demo) <- "foo"
  expect_identical(identifier(demo), "foo")
})

test_that('short_identifier(demo) <- "foo" works', {
  load("demo.rda")
  short_identifier(demo) <- "foo"
  expect_identical(short_identifier(demo), "foo")
})

test_that('creator(demo) <- "foo" works', {
  load("demo.rda")
  creator(demo) <- "foo"
  expect_identical(creator(demo), "foo")
})

test_that('orcid(demo) <- "foo" works', {
  load("demo.rda")
  orcid(demo) <- "foo"
  expect_identical(orcid(demo), "foo")
})

test_that('created(demo) <- "foo" works', {
  load("demo.rda")
  created(demo) <- "foo"
  expect_identical(created(demo), "foo")
})

test_that('checksum(demo) <- "foo" works', {
  load("demo.rda")
  checksum(demo) <- "foo"
  expect_identical(checksum(demo), "foo")
})

test_that('checksum_function(demo) <- "foo" works', {
  load("demo.rda")
  checksum_function(demo) <- "foo"
  expect_identical(checksum_function(demo), "foo")
})

test_that('status(demo) <- "foo" works', {
  load("demo.rda")
  status(demo) <- "foo"
  expect_identical(status(demo), "foo")
})

test_that('locations(demo) <- list("foo") works', {
  load("demo.rda")
  locations(demo) <- list("foo")
  expect_identical(locations(demo), list("foo"))
})

test_that('titles(demo) <- list("foo") works', {
  load("demo.rda")
  titles(demo) <- list("foo")
  expect_identical(titles(demo), list("foo"))
})

test_that('obsoleted_by(demo) <- list("foo") works', {
  load("demo.rda")
  obsoleted_by(demo) <- list("foo")
  expect_identical(obsoleted_by(demo), list("foo"))
})

test_that('content_key(demo) <- "foo" works', {
  load("demo.rda")
  content_key(demo) <- "foo"
  expect_identical(content_key(demo), "foo")
})

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
