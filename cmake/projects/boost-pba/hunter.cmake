# Copyright (c) 2017, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_package)
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    boost-pba
    VERSION
    "1.0.0"
    URL
    "https://github.com/hunter-packages/boost-pba/archive/v1.0.0.tar.gz"
    SHA1
    65b28b923cf0330860b36d568bf4a98503fb0455
)

hunter_add_version(
    PACKAGE_NAME
    boost-pba
    VERSION
    "1.0.0-p0"
    URL
    "https://github.com/hunter-packages/boost-pba/archive/v1.0.0-p0.tar.gz"
    SHA1
    c4dd316edbb6839c5be2a5e1a9decd3bdfd848d0
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(boost-pba)
hunter_download(PACKAGE_NAME boost-pba)
