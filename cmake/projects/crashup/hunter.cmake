# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    crashup
    VERSION
    0.0.2
    URL
    "https://github.com/qedsoftware/crashup/archive/v0.0.2.tar.gz"
    SHA1
    cc826c9fb28301e67a8fee6459779b2de5b024f5
)

hunter_add_version(
    PACKAGE_NAME
    crashup
    VERSION
    0.0.1
    URL
    "https://github.com/qedsoftware/crashup/archive/v0.0.1.tar.gz"
    SHA1
    e7a86b394d36b08587f9d229d931d814192f6b53
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(crashup)
hunter_download(PACKAGE_NAME crashup)
