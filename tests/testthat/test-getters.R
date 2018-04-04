context("test_minid_getters - unit tests")

test_that("identifier(minid) returns the expected string", {
  data("demo", package = "minidtools")
  expect_identical(identifier(demo), "ark:/57799/b9j69h")
})

test_that("creator(minid) returns the expected string", {
  data("demo", package = "minidtools")
  expect_identical(creator(demo), "mdarcy (0000-0003-2280-917X)")
  })

test_that("created(minid) returns the expected string", {
  data("demo", package = "minidtools")
  expect_identical(created(demo), "Mon, 19 Mar 2018 17:43:57 GMT")
})

test_that("checksum(minid) returns the expected string", {
  data("demo", package = "minidtools")
  checksum = paste0("6484968f81afac84857d02b573b0d589fb2f9582a2b920572830dc",
                    "5781e0a53c")
  expect_identical(checksum(demo), checksum)
})

test_that("checksum_function(minid) returns the expected string", {
  data("demo", package = "minidtools")
  expect_identical(checksum_function(demo), "SHA")
})

test_that("status(minid) returns the expected string", {
  data("demo", package = "minidtools")
  expect_identical(status(demo), "ACTIVE")
})

test_that("locations(minid) returns the expected string", {
  data("demo", package = "minidtools")
  locations = list(
    "mdarcy - https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz")
  expect_identical(locations(demo), locations)
})

test_that("titles(minid) returns the expected string", {
  data("demo", package = "minidtools")
  expect_match(titles(demo)[[1]], "mdarcy - AGR Data.*")
})
