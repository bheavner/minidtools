context("test_title - unit tests")

test_that("title('ark:/57799/b9j69h') returns expected value", {
  load("demo-config.rda")
  server <- server(demo_config)
  expect_message(title("ark:/57799/b9j69h"), server = server)
  expect_identical(
    title("ark:/57799/b9j69h", server = server),
    "AGR Data set with identifier-based references to data in cloud storage")
})

test_that("title(minid) returns expected value", {
  load("demo.rda")
  expect_identical(title(demo),
                   paste0("AGR Data set with identifier-based references ",
                          "todata in cloud storage"))
})
