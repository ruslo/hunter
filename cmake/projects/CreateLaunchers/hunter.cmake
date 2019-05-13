# Copyright (c) 2013-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    CreateLaunchers
    VERSION
    "0.2.1"
    URL
    "https://github.com/caseymcc/CreateLaunchers/archive/0.2.1.tar.gz"
    SHA1
    e330f0c8a7562f23eb323c36c2ce9417a88686ea
)

hunter_add_version(
    PACKAGE_NAME
    CreateLaunchers
    VERSION
    "0.2.0"
    URL
    "https://github.com/caseymcc/CreateLaunchers/archive/0.2.0.tar.gz"
    SHA1
    c09496f49eb6557f91cd0f927d61bf901f38240d
)

hunter_add_version(
    PACKAGE_NAME
    CreateLaunchers
    VERSION
    "0.1.0"
    URL
    "https://github.com/caseymcc/CreateLaunchers/archive/0.1.0.tar.gz"
    SHA1
    f0769de3d5968d1308ee9c9a566f0619a94a288a
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(CreateLaunchers)
hunter_download(PACKAGE_NAME CreateLaunchers)
