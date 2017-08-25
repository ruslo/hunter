# Copyright (c) 2013-2017, Ruslan Baratov, Richard Hodges
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
        PACKAGE_NAME
        SocketIOClient
        VERSION
        "1.6.1"
        URL
        "https://github.com/madmongo1/socket.io-client-cpp/archive/v1.6.1-hunter-1.tar.gz"
        SHA1
        3e67677d8d0328c07c7a2d2c9e8ebda87c9ad583
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SocketIOClient)
hunter_download(PACKAGE_NAME SocketIOClient)
