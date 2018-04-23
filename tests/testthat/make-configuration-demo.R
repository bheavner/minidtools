demo_config <- configuration(
  server = "http://minid.bd2k.org/minid",
  user = "Jane Smith",
  email = "jsmith@example.com",
  orcid = "0000-0003-2898-9044",
  code = "XXXX-XXX-XXXXX-XXXX-XXXX"
)

save(demo_config, file = "demo-config.rda")
