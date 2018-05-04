context("test_get_newer - unit tests")

test_that("get_newer('ark:/57799/b9j69h') returns expected value", {
  load("demo-config.rda")
  server <- server(demo_config)
  expect_identical(get_newer("ark:/57799/b9j69h", server = server),
                   "minid:b94x3r")
})

test_that("get_newer(minid) returns expected value", {
  load("demo.rda")
  expect_identical(get_newer(demo), "ark:/57799/b9j69h")
})
