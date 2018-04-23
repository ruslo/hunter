# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    WebKit
    VERSION
    0.0.2
    URL
    "https://github.com/hunter-packages/WebKit/archive/v0.0.2.tar.gz"
    SHA1
    2da25c0485984e8ffb236050316d454e6c0ff849
)

hunter_add_version(
    PACKAGE_NAME
    WebKit
    VERSION
    0.0.2-p0
    URL
    "https://github.com/hunter-packages/WebKit/archive/v0.0.2-p0.tar.gz"
    SHA1
    a7becb00409bd2731040b175dd4fe69792014714
)

hunter_cmake_args(
    WebKit
    CMAKE_ARGS
    PORT=JSCOnly
    ENABLE_TOOLS=OFF
    ENABLE_API_TESTS=OFF
    ENABLE_WEBCORE=OFF
    ENABLE_WEBKIT=OFF
    ENABLE_JIT=ON
)

# Package is pretty big + Debug is not working on Android
hunter_configuration_types(WebKit CONFIGURATION_TYPES Release)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(WebKit)
hunter_download(PACKAGE_NAME WebKit)
