# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    JsonSpirit
    VERSION
    "0.0.1-hunter"
    URL
    "https://github.com/hunter-packages/json_spirit/archive/v0.0.1-hunter.tar.gz"
    SHA1
    9d789aa8329d9aae655c15feb8943c5e583eaa06
)

hunter_add_version(
    PACKAGE_NAME
    JsonSpirit
    VERSION
    "0.0.2-hunter"
    URL
    "https://github.com/hunter-packages/json_spirit/archive/v0.0.2-hunter.tar.gz"
    SHA1
    63587775baad756d6ed0927033bd03886570f743
)

hunter_add_version(
    PACKAGE_NAME
    JsonSpirit
    VERSION
    "0.0.3-hunter"
    URL
    "https://github.com/hunter-packages/json_spirit/archive/v0.0.3-hunter.tar.gz"
    SHA1
    fd1fc800206b5feba7174c5031d207afc4dd7765
)

hunter_add_version(
    PACKAGE_NAME
    JsonSpirit
    VERSION
    "0.0.4-hunter"
    URL
    "https://github.com/hunter-packages/json_spirit/archive/v0.0.4-hunter.tar.gz"
    SHA1
    2e71239f1d5f3e78a18e5e41c1d60b44b14a21e8
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME JsonSpirit)
