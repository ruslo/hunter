# Copyright (c) 2016-2019, Ruslan Baratov
# Copyright (c) 2019 Richard Hodges
# Copyright (c) 2019 Quoine Corporation
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    CppJwt
    VERSION
    1.2.0-hunter0
    URL
    "https://github.com/QuoineFinancial/cpp-jwt/archive/v1.2.0-hunter0.tar.gz"
    SHA1
    0225e8533f9f5bd2f14d009ed1c8f29ced143092
)

hunter_configuration_types(CppJwt CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(CppJwt)
hunter_download(PACKAGE_NAME CppJwt)
