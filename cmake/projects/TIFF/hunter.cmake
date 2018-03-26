# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    TIFF
    VERSION
    "4.0.2-p3"
    URL
    "https://github.com/hunter-packages/tiff/archive/v4.0.2-p3.tar.gz"
    SHA1
    f805dd2d7faa360e51a9e043d118b77d5b157bf1
)

hunter_add_version(
    PACKAGE_NAME
    TIFF
    VERSION
    "4.0.2-hunter-2"
    URL
    "https://github.com/hunter-packages/tiff/archive/v4.0.2-hunter-2.tar.gz"
    SHA1
    a891cb185256925d983e87d664304c4b6ff31779
)

hunter_add_version(
    PACKAGE_NAME
    TIFF
    VERSION
    "4.0.2-hunter-1"
    URL
    "https://github.com/hunter-packages/tiff/archive/v4.0.2-hunter-1.tar.gz"
    SHA1
    9088be15b54257f227988e1b479b7394e944fe71
)

hunter_add_version(
    PACKAGE_NAME
    TIFF
    VERSION
    "4.0.2"
    URL
    "https://github.com/hunter-packages/tiff/archive/v4.0.2.tar.gz"
    SHA1
    37c71656488797c4e5fde620570f1a1b9be36037
)

hunter_add_version(
    PACKAGE_NAME
    TIFF
    VERSION
    "4.0.2-p4"
    URL
    "https://github.com/hunter-packages/tiff/archive/v4.0.2-p4.tar.gz"
    SHA1
    9ab44e0136d3da04b0a559d7ba57bd075afc48f9
)

hunter_add_version(
    PACKAGE_NAME
    TIFF
    VERSION
    "4.0.2-p5"
    URL
    "https://github.com/hunter-packages/tiff/archive/v4.0.2-p5.tar.gz"
    SHA1
    7bee2843b47c5f9865973b7235e58aa3fb26e1b0
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(TIFF)
hunter_download(PACKAGE_NAME TIFF)
