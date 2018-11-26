# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    breakpad
    VERSION
    0.0.0-12ecff3-p0
    URL
    "https://github.com/hunter-packages/breakpad/archive/v0.0.0-12ecff3-p0.tar.gz"
    SHA1
    319369529559af52e56abdb7f152b0adf064964b
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(breakpad)
hunter_download(PACKAGE_NAME breakpad)
