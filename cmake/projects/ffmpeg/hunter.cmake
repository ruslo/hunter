# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    ffmpeg
    VERSION
    n4.1-dev-45499e557c-p1
    URL
    "https://github.com/hunter-packages/FFmpeg/archive/n4.1-dev-45499e557c-p1.tar.gz"
    SHA1
    cc130bde82f4f71fed00496a5a9b9348f427536e
)

hunter_add_version(
    PACKAGE_NAME
    ffmpeg
    VERSION
    n4.1-dev-45499e557c-p2
    URL
    "https://github.com/hunter-packages/FFmpeg/archive/n4.1-dev-45499e557c-p2.tar.gz"
    SHA1
    41935479eda43783440d220bb9da04f4dae5ceaa
)

hunter_add_version(
    PACKAGE_NAME
    ffmpeg
    VERSION
    n4.1-dev-45499e557c-p3
    URL
    "https://github.com/hunter-packages/FFmpeg/archive/n4.1-dev-45499e557c-p3.tar.gz"
    SHA1
    4f14e0ffd920f8cd5e17496189166ce5b6a5983b
)

hunter_add_version(
    PACKAGE_NAME
    ffmpeg
    VERSION
    n4.1-dev-45499e557c-p4
    URL
    "https://github.com/hunter-packages/FFmpeg/archive/n4.1-dev-45499e557c-p4.tar.gz"
    SHA1
    e54bfe17b6e6d46de28ee79599e691b318ea50e4
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ffmpeg)
hunter_download(PACKAGE_NAME ffmpeg)
