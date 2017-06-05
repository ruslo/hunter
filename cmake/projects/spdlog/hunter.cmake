# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    spdlog
    VERSION
    "1.0.0-p0"
    URL
    "https://github.com/hunter-packages/spdlog/archive/v1.0.0-p0.tar.gz"
    SHA1
    4d9967d165fc7ea2d561210bec2f50e60547daa6
)

hunter_add_version(
    PACKAGE_NAME
    spdlog
    VERSION
    "0.13.0-p0"
    URL
    "https://github.com/hunter-packages/spdlog/archive/v0.13.0-p0.tar.gz"
    SHA1
    b34b92075423d9da196daefe796316393a0fd593
)

hunter_add_version(
    PACKAGE_NAME
    spdlog
    VERSION
    "0.12.0-p0"
    URL
    "https://github.com/hunter-packages/spdlog/archive/v0.12.0-p0.tar.gz"
    SHA1
    b10bf7b537198a5f2224c3e022db38da9b2f3d53
)

hunter_add_version(
    PACKAGE_NAME
    spdlog
    VERSION
    "0.11.0-p0"
    URL
    "https://github.com/hunter-packages/spdlog/archive/v0.11.0-p0.tar.gz"
    SHA1
    199c1a19bcdd6fc75faa61263a267805c05e4060
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(spdlog)
hunter_download(PACKAGE_NAME spdlog)
