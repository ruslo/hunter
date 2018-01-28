# Copyright (c) 2016-2018, Ruslan Baratov
# Copyright (c) 2018, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    cvsteer
    VERSION
    0.1.1
    URL
    "https://github.com/headupinclouds/cvsteer/archive/v0.1.1.tar.gz"
    SHA1
    b54b096910c0947e1af125e134b2511b25dc847d
    )

hunter_add_version(
    PACKAGE_NAME
    cvsteer
    VERSION
    0.1.2
    URL
    "https://github.com/headupinclouds/cvsteer/archive/v0.1.2.tar.gz"
    SHA1
    a61ae7e1b965d47bca449721150576711f3f7f67
    )
  
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(cvsteer)
hunter_download(PACKAGE_NAME cvsteer)
