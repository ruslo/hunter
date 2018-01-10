# Copyright (c) 2016-2017, Ruslan Baratov
# Copyright (c) 2017, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    rabit
    VERSION
    0.0.0-p2
    URL
    https://github.com/hunter-packages/rabit/archive/v0.0.0-p2.tar.gz
    SHA1
    bdb425ca303e1b09bdf8245eed419834bc9b4752
    )

hunter_add_version(
    PACKAGE_NAME
    rabit
    VERSION
    0.0.0-p1
    URL
    https://github.com/hunter-packages/rabit/archive/v0.0.0-p1.tar.gz
    SHA1
    f2bb803b381bebe42089acf9946848dd580d9470
    )

hunter_add_version(
    PACKAGE_NAME
    rabit
    VERSION
    0.0.0-p0
    URL
    https://github.com/hunter-packages/rabit/archive/v0.0.0-p0.tar.gz
    SHA1
    4f0a65c6f1fcd6b7cce1618aa49faf25e8a8a337
    )
  
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(rabit)
hunter_download(PACKAGE_NAME rabit)
