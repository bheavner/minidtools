context("test_lookup - unit tests")
#' my_minid <- lookup(query = "ark:/57799/b9j69h", configuration = config)
#' my_minid <- lookup(query = "minid:b9j69h", configuration = config)
#' my_minid <- lookup(query = "file:./some/file.RDa", algo = "md5",
#'                    configuration = config)
#'
test_that("lookup('ark:/57799/b9j69h') returns expected minid", {
  load("demo-config.rda")
  config <- demo_config
  expect_identical(
    identifier(lookup("ark:/57799/b9j69h", configuration = config)),
    "ark:/57799/b9j69h")
})

test_that("lookup('minid:b9j69h') returns expected minid", {
  load("demo-config.rda")
  config <- demo_config
  expect_identical(
    identifier(lookup("minid:b9j69h", configuration = config)),
    "ark:/57799/b9j69h")
})

test_that("lookup(checksum) returns expected minid", {
  load("demo-config.rda")
  config <- demo_config
  checksum <- "6484968f81afac84857d02b573b0d589fb2f9582a2b920572830dc5781e0a53c"
  expect_identical(
    identifier(lookup(checksum, configuration = config)),
    "ark:/57799/b9j69h")
})

# TODO - add test for file-based lookup after I mint a minid for one