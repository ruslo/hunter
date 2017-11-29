# Copyright (c) 2016, Dean Hunter
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    TinyXML
    VERSION
    1.0.0
    URL
    "https://github.com/deanhu2/TinyXML-Hunter-package/archive/v1.0.0.tar.gz"
    SHA1
    2667af636f6256a3ecddeae702474593c2e7872b
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(TinyXML)
hunter_download(PACKAGE_NAME TinyXML)
