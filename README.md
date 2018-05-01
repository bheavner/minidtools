| **Service** | **Master** | **Develop** |
|:-------------:|:------:|:-------:|
| CI Status | [![Travis-CI Build Status](https://travis-ci.org/bheavner/minidtools.svg?branch=master)](https://travis-ci.org/bheavner/minidtools) | [![Travis-CI Build Status](https://travis-ci.org/bheavner/minidtools.svg?branch=develop)](https://travis-ci.org/bheavner/minidtools) |
| Test Coverage | [![Coverage Status](https://img.shields.io/codecov/c/github/bheavner/minidtools/master.svg)](https://codecov.io/github/bheavner/minidtools?branch=master) | [![Coverage Status](https://img.shields.io/codecov/c/github/bheavner/minidtools/develop.svg)](https://codecov.io/github/bheavner/minidtools?branch=develop) |

# minidtools
An R API client for the 
[minid server](https://github.com/ini-bdds/minid-server). There's a 
[python client](https://github.com/fair-research/minid), too.

A minid (Minimal Viable Identifier) is an identifier that is sufficiently
simple to make creation and use trivial, while still having enough substance to
make data easily findable, accessible, interoperable, and reusable (FAIR).
Minids look like this: `ark:/57799/b9j69h` or this: `minid:b9j69h`. 

`minidtools` provides functions for working with minids from an R session.
For now, the focus is on lookup tools, such as finding metadata provided by a
minid, including resolving locations for the digital object a minid identifies.

Tools for minting your own minids for digital objects are high on the to-do
list.

## Installation ##

You can install minidtools from github with:

```
# install.packages("devtools") 
devtools::install_github("bheavner/minidtools")
```

## Quick Usage ##
### Resolve Minid ###
* Get location of digital object from a minid
```
get_location("minid:b94t3q")
```

* Get title of digital object from minid
```
get_title("ark:/57799/b9j69h")
```

* Get newer minid for minids that have `status = TOMBSTONED`
```
get_newer("minid:b94t3q")
```

* Get all metadata for minid
```
lookup("minid:b94t3q")
```

* get minid for file that has an identifier (e.g. a file you've downloaded after
 resolving a minid)
```
lookup("file:./somefile.RDa", algo = "sha256")
```

### Register User ###
```
config <- configuration()
user(config) <- "Jane Example"
email(config) <- "jexample@example.com"
orcid(config) <- "0000-0000-0000-0000" # see https://orcid.org/
register(config)

# check email to get code, then add it to the config object
code(config) <- "0000000-0000-0000-0000-000000000000"
save_configuration(config)
```

### Load Configuration from file ###
```
config <- load_configuration()
```

### Mint Minid ###
```
mint(minid = "./someFile.RDa", config)
```

### Edit Minid ###
* coming soon

## Expanded Usage ##

### Resolution and lookup functions ###
* Retrieve all metadata for a minid or local file that has been registered
```
my_minid <- lookup(query = "ark:/57799/b9j69h", 
                   server = "http://minid.bd2k.org/minid")

my_minid <- lookup(query = "minid:b9j69h",
                   server = "http://minid.bd2k.org/minid")

my_minid <- lookup(query = "file:./some/file.RDa",
                   algo = "md5",
                   server = "http://minid.bd2k.org/minid")

# or, if configuration file has been loaded
my_minid <- lookup(query = "ark:/57799/b9j69h", 
                   server = server(configuration))
```

* show all metadata for minid
```
my_minid
```

* Get list of locations for digitial object from metadata
```
locations(my_minid)
```

* Get other metadata values from metadata
```
identifier(my_minid)
short_identifier(my_minid)
checksum(my_minid)
titles(my_minid) # returns named list with created, creator, title
locations(my_minid) # returns named list with created, creator, link, uri
status(my_minid) # ACTIVE or TOMBSTONED
obsoleted_by(my_minid) # returns list
content_key(my_minid)
creator(my_minid)
orcid(my_minid)
created(my_minid)
checksum_function(my_minid)
```

* Get nth (default first) location of digital object from a minid or metadata
```
get_location(minid = "minid:b94t3q")

get_location(minid = "ark:/57799/b9j69h", n = 1, 
             server = "http://minid.bd2k.org/minid")

get_location(minid = "minid:b94t3q", n = 1, server = server(configuration))

get_location(my_minid)
```

* Get nth (default first) title of digital object from minid or metadata
```
get_title(minid = "minid:b94t3q")

get_title(minid = "ark:/57799/b9j69h", n = 1, 
             server = "http://minid.bd2k.org/minid")

get_title(minid = "minid:b94t3q", n = 1, server = server(configuration))

get_title(my_minid)
```

* Get nth (default first) newer minid for minids that have status = TOMBSTONED 
(returns current ID if status = ACTIVE)
```
get_newer(minid = "minid:b94t3q")

get_newer(minid = "ark:/57799/b9j69h", n = 1, 
             server = "http://minid.bd2k.org/minid")

get_newer(minid = "minid:b94t3q", n = 1, server = server(configuration))

get_newer(my_minid)
```

### User registration and configuration ###
Before using the minid API to mint or edit minids, you need to validate
your email address. You can do this with the `register()` function. When you
register, the minid server will send a unique code to your email address. You
must present this code along with your email address when minting or updating
minids.

The `register()` function takes a `configuration` object as it's argument.
Users can build a configuration object manually, e.g.
```
config <- configuration()
user(config) <- "Jane Example"
email(config) <- "jexample@example.com"
orcid(config) <- "0000-0000-0000-0000" # see https://orcid.org/
```

As a convenience, users can also save the configuration object (including the
registration code, specified with `code(config)`) in a minid configuration file.
The minid configuration file can be formatted either as a python config-style or
JSON config file (default paths are `~/.minid/minid-config.cfg` and 
`~/.minid/minid-config.json`, respectively.)

These files look like this:
`minid-config.cfg`:
```
[general]
minid_server: http://minid.bd2k.org/minid
user: <Name>
email: <Email>
orcid: <optional Orcid>
code: <Code>
```

`minid-config.json`
```
{
        "default": {
                "minid_server": "http://minid.bd2k.org/minid",
                "username": "<Name>",
                "email": "<Email>",
                "orcid": "<optional Orcid>",
                "code": "<Code>"
        }
}
```

* Create a blank configuration object and add values
```
config <- configuration()
server(config) <- "http://minid.bd2k.org/minid"
user(config) <- "Jane Example"
email(config) <- "jexample@example.com"
orcid(config) <- "0000-0000-0000-0000" # see orcid.org
code(config) <- <Code>
```

* save a configuration object to file
```
save_configuration(config, 
                   config_path = "~/.minid/minid-config.json")
                   
save_configuration(config,
                  config_path = "~/.minid/minid-config.cfg",
                  python_style = TRUE)
```

* load a configuration file
```
config <- load_configuration(config_file = "~/.minid/minid-config.json")
```

* get server from configuration object
```
server(config)
```

* get other fields from configuration object
```
user(config)
email(config)
orcid(config)
code(config)
```

### Creating minids ###
* mint minid from a file path (note: will need to add location(s) subsequently)
```
config <- load_configuration()
mint(minid = "./a_file.RDa", configuration = config, test = TRUE)
```

* mint minid from configuration and minid objects
```
# set up new configuration object
config <- configuration()
user(config) <- "Jane Example"
email(config) <- "jexample@example.com"
orcid(config) <- "0000-0000-0000-0000" # see http://orch.id
code(config) <- "00000000-0000-0000-0000-000000000000" # see register()

# set up minid object
new_minid <- minid()
checksum_function(new_minid) <- "sha256"
checksum(new_minid) <- digest::digest("./somefile.RDa",
                                      file = TRUE,
                                       algo = "sha256")
titles(new_minid) <- list(title = "An Example Object Title")
locations(new_minid) <- list(link = "http://example.com/somefile.RDa") # optional

# mint the new minid
mint(minid = new_minid, configuration = config, test = TRUE)
```

* mint minid from named lists
```
computed_checksum <- digest::digest("./somefile.RDa",
                                    file = TRUE,
                                    algo = "sha256")
new_minid = list(
  checksum_function = "sha256",
  checksum = computed_checksum,
  titles = "An Example Object Title",
  locations = "http://example.com/somefile.RDa")

configuration = list(
  server = "http://minid.bd2k.org/minid",
  user(config) <- "Jane Example"
  email(config) <- "jexample@example.com"
  orcid(config) <- "0000-0000-0000-0000", # see http://orch.id
  code(config) <- "00000000-0000-0000-0000-000000000000" # see register()
  )
  
minted <- mint(minid = new_minid, configuration = config, test = TRUE)
```
or
```
minid_list <- as.list(minid)
config_list <- as.list(config)
minted <- mint(minid = minid_list, configuration = config_list, test = TRUE)
```

### Revising minids ###
* coming soon

## More information ##
More information about the project can be found at: 
[http://minid.bd2k.org/](http://minid.bd2k.org/)