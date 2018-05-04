context("test_minid_getters - unit tests")

test_that("identifier(minid) returns the expected string", {
  load("demo.rda")
  expect_identical(identifier(demo), "ark:/57799/b9j69h")
})

test_that("short_identifier(minid) returns the expected string", {
  load("demo.rda")
  expect_identical(short_identifier(demo), "minid:b9j69h")
})

test_that("creator(minid) returns the expected string", {
  load("demo.rda")
  expect_identical(creator(demo), "mdarcy")
  })

test_that("orcid(minid) returns the expected string", {
  load("demo.rda")
  expect_identical(orcid(demo), "<id string>")
})

test_that("created(minid) returns the expected string", {
  load("demo.rda")
  expect_identical(created(demo), "Mon, 19 Mar 2018 17:43:57 GMT")
})

test_that("checksum(minid) returns the expected string", {
  load("demo.rda")
  checksum <- paste0("6484968f81afac84857d02b573b0d589fb2f9582a2b920572830dc",
                    "5781e0a53c")
  expect_identical(checksum(demo), checksum)
})

test_that("checksum_function(minid) returns the expected string", {
  load("demo.rda")
  expect_identical(checksum_function(demo), "SHA")
})

test_that("status(minid) returns the expected string", {
  load("demo.rda")
  expect_identical(status(demo), "ACTIVE")
})

test_that("locations(minid) returns the expected list", {
  load("demo.rda")
  expected_locations <- list(
    list(created = "Mon, 19 Mar 2018 17:43:57 GMT",
         creator = "mdarcy",
         link = "https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz",
         uri = "https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz"))
  expect_identical(locations(demo), expected_locations)
})

test_that("titles(minid) returns the expected list", {
  load("demo.rda")
  expected_titles <- list(
    list(created = "Mon, 19 Mar 2018 17:43:57 GMT",
         creator = "mdarcy",
         title = paste0("AGR Data set with identifier-based references to",
                        "data in cloud storage")))
  expect_identical(titles(demo), expected_titles)
})

test_that("obsoleted_by(minid) returns a list", {
  load("demo.rda")
  expect_true(is.list(obsoleted_by(demo)))
})

test_that("content_key(minid) returns a string", {
  load("demo.rda")
  expect_true(is.character(content_key(demo)))
})

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
