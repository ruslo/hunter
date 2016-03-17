# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    CppNetlib
    VERSION
    "0.10.1-hunter-1"
    URL
    "https://github.com/hunter-packages/cpp-netlib/archive/v0.10.1-hunter-1.tar.gz"
    SHA1
    fca9bb6d77162b6c3e5d822a46d4bb311e864592
)

hunter_add_version(
    PACKAGE_NAME
    CppNetlib
    VERSION
    "0.10.1-hunter-2"
    URL
    "https://github.com/hunter-packages/cpp-netlib/archive/v0.10.1-hunter-2.tar.gz"
    SHA1
    2ad785004359bff887475f0df672f00eb3399df9
)

hunter_add_version(
    PACKAGE_NAME
    CppNetlib
    VERSION
    "0.10.1-hunter-3"
    URL
    "https://github.com/hunter-packages/cpp-netlib/archive/v0.10.1-hunter-3.tar.gz"
    SHA1
    b9e558264a4c2e24a59e037cfeb38509e2ce664c
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME CppNetlib)
