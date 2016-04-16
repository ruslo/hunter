# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    CppNetlibUri
    VERSION
    "1.0.4-hunter"
    URL
    "https://github.com/hunter-packages/uri/archive/v1.0.4-hunter.tar.gz"
    SHA1
    731ed6bde98c96676e1d1947e6e57f4e4c651442
)

hunter_add_version(
    PACKAGE_NAME
    CppNetlibUri
    VERSION
    "1.0.3-hunter"
    URL
    "https://github.com/hunter-packages/uri/archive/v1.0.3-hunter.tar.gz"
    SHA1
    24d7a2e1ec9ee6550a5127c9dcd10c82dbe8ebb7
)

hunter_add_version(
    PACKAGE_NAME
    CppNetlibUri
    VERSION
    "1.0.2-hunter"
    URL
    "https://github.com/hunter-packages/uri/archive/v1.0.2-hunter.tar.gz"
    SHA1
    2de5bd44b4bf8a7caf2e56d3c4bf2fbb0db0dadf
)

hunter_add_version(
    PACKAGE_NAME
    CppNetlibUri
    VERSION
    "1.0.1-hunter"
    URL
    "https://github.com/hunter-packages/uri/archive/v1.0.1-hunter.tar.gz"
    SHA1
    a1e05fb1b571532e407604e8a3ad04153ee63f75
)

hunter_add_version(
    PACKAGE_NAME
    CppNetlibUri
    VERSION
    "1.0.0-hunter"
    URL
    "https://github.com/hunter-packages/uri/archive/v1.0.0-hunter.tar.gz"
    SHA1
    c093562c2588c84749f2645f652c372655052c1c
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME CppNetlibUri)
