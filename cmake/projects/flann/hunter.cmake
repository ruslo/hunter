# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    flann
    VERSION
    "1.9.1"
    URL
    "https://github.com/mariusmuja/flann/archive/1.9.1.tar.gz"
    SHA1
    ca3aee5670297f1db2eff122679ed9e87a70d830
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME flann)

