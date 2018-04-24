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
get_title("ark:/57799/b9j69h"")
```

* Get newer minid for minids that have status = TOMBSTONED
```
get_newer("minid:b94t3q")
```

* Get all metadata for minid
```
lookup("minid:b94t3q")
```

* get minid for file using checksum
```
lookup("fe1d7fc641ae2befae2b7c2a989019553b22e21cdda7b9d6054617921b821613")
```

### Register User ###
* coming soon

### Load Configuration from file ###
```
load_configuration()
```

### Mint Minid ###
* coming soon

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
Before using the minid API to register or update minids, you need to validate
your email address. *function to come soon*. When you register, the minid
server will send a unique code to your email address. You must present this code
along with your email address when minting or updating minids.
As a convenience, you can specify the server, user name, email, orcid, and your
unique code in a minid configuration file in either a python config-style or
JSON config file (default paths are `~/.minid/minid-config.cfg` and 
`~/.minid/minid-config.json`)

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

* more coming soon

### Creating and revising minids ###
* coming soon

## More information ##
More information about the project can be found at: 
[http://minid.bd2k.org/](http://minid.bd2k.org/)