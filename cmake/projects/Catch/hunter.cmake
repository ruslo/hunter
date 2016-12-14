# Copyright (c) 2016 Alexey Ulyanov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_pick_scheme)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    Catch
    VERSION
    "1.5.9"
    URL
    "https://github.com/philsquared/Catch/archive/v1.5.9.tar.gz"
    SHA1
    8bc32146a5a2789cd3d3ce2893772e32f412f1b1
)

hunter_pick_scheme(DEFAULT url_sha1_catch)
hunter_download(PACKAGE_NAME Catch)
