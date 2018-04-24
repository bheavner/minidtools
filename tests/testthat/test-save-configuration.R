context("test_save_configuration - unit tests")

test_that("save_configuration() writes expected JSON", {
  config <- configuration(
    server = "http://minid.bd2k.org/minid",
    user = "Jane Smith",
    email = "jsmith@example.com",
    orcid = "0000-0003-2898-9044",
    code = "XXXX-XXX-XXXXX-XXXX-XXXX"
    )
  save_configuration(config, config_path = "./test_save.json", overwrite = TRUE)
  target_json <- paste0('{"default":{"minid_server":["http://minid.',
                        'bd2k.org/minid"],"user":["Jane Smith"],"email":',
                        '["jsmith@example.com"],"orcid":',
                        '["0000-0003-2898-9044"],',
                        '"code":["XXXX-XXX-XXXXX-XXXX-XXXX"]}}')
  expect_identical(readr::read_file("./test_save.json"), target_json)
})

test_that("save_configuration() writes expected python config", {
  config <- configuration(
    server = "http://minid.bd2k.org/minid", #nolint
    user = "Jane Smith",
    email = "jsmith@example.com",
    orcid = "0000-0003-2898-9044",
    code = "XXXX-XXX-XXXXX-XXXX-XXXX"
  )
  save_configuration(config, config_path = "./test_save.cfg",
                     python_style = TRUE, overwrite = TRUE)
  target_cfg <- paste0("[general]\nminid_server: http://minid.bd2k.org/",
                        "minid\nuser: Jane Smith\nemail: jsmith@",
                        "example.com\norcid: 0000-0003-2898-9044\n",
                        "code: XXXX-XXX-XXXXX-XXXX-XXXX\n")
  expect_identical(readr::read_file("./test_save.cfg"), target_cfg)
})

test_that("save_configuration() gives error on attempted overwrite", {
  config <- configuration(
    server = "http://minid.bd2k.org/minid", #nolint
    user = "Jane Smith",
    email = "jsmith@example.com",
    orcid = "0000-0003-2898-9044",
    code = "XXXX-XXX-XXXXX-XXXX-XXXX"
  )
  expect_error(save_configuration(config, config_path = "./test_save.cfg",
                     python_style = TRUE, overwrite = FALSE))
})
