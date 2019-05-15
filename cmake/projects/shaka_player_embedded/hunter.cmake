# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    shaka_player_embedded
    VERSION
    0.1.0-beta-p0
    URL
    "https://github.com/hunter-packages/shaka-player-embedded/archive/v0.1.0-beta-p0.tar.gz"
    SHA1
    a0d991550e12ba8e55c3731b250d7100e637b39f
)

hunter_add_version(
    PACKAGE_NAME
    shaka_player_embedded
    VERSION
    0.1.0-beta-p1
    URL
    "https://github.com/hunter-packages/shaka-player-embedded/archive/v0.1.0-beta-p1.tar.gz"
    SHA1
    012e02170e2ce43165909de0ee4b264fd72d6727
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(shaka_player_embedded)
hunter_download(PACKAGE_NAME shaka_player_embedded)
