context("test_newer - unit tests")

test_that("newer('ark:/57799/b9j69h') returns expected value", {
  load("demo-config.rda")
  server <- server(demo_config)
  expect_identical(newer("ark:/57799/b9j69h", server = server), "minid:b94x3r")
})

test_that("newer(minid) returns expected value", {
  load("demo.rda")
  expect_identical(newer(demo), "ark:/57799/b9j69h")
})
