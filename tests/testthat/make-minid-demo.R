demo <- minid(
  identifier = "ark:/57799/b9j69h",
  short_identifier = "minid:b9j69h",
  creator = "mdarcy",
  orcid = "<id string>",
  created = "Mon, 19 Mar 2018 17:43:57 GMT",
  checksum = paste0("6484968f81afac84857d02b573b0d589fb2f9582a2b920572830dc",
                    "5781e0a53c"),
  checksum_function = "SHA",
  status = "ACTIVE",
  locations = list(
    list(created = "Mon, 19 Mar 2018 17:43:57 GMT",
         creator = "mdarcy",
         link = "https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz",
         uri = "https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz")),
  titles = list(
    list(created = "Mon, 19 Mar 2018 17:43:57 GMT",
         creator = "mdarcy",
         title = paste0("AGR Data set with identifier-based references to",
                        "data in cloud storage"))),
    obsoleted_by = list(NULL),
    content_key = as.character(NULL)
  )

save(demo, file = "demo.rda")
