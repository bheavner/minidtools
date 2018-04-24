context("test_location - unit tests")

test_that("location('ark:/57799/b9j69h') returns expected value", {
  load("demo-config.rda")
  server <- server(demo_config)
  expect_message(location("ark:/57799/b9j69h"), server = server)
  expect_identical(
    location("ark:/57799/b9j69h", server = server),
    "https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz")
})

test_that("location(minid) returns expected value", {
  load("demo.rda")
  expect_identical(location(demo),
                   "https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz")
})
