# Copyright (c) 2017, Pawel Bylica

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    libscrypt
    VERSION
    1.21-p0
    URL
    "https://github.com/hunter-packages/libscrypt/archive/v1.21-p0.tar.gz"
    SHA1
    2910558f6275fe4ce077038fcb96f7e0ba9521a3
)

hunter_add_version(
    PACKAGE_NAME
    libscrypt
    VERSION
    1.21-p1
    URL
    "https://github.com/hunter-packages/libscrypt/archive/v1.21-p1.tar.gz"
    SHA1
    2c70238da6471224c9b37d7e328e5955f0fb42f3
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(libscrypt)
hunter_download(PACKAGE_NAME libscrypt)
