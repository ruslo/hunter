# Copyright (c) 2015-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# https://dl.google.com/android/repository/sys-img/android/sys-img.xml

hunter_add_version(
    PACKAGE_NAME
    Android-ARM-EABI-v7a-System-Image
    VERSION
    "16_r04"
    URL
    "https://dl.google.com/android/repository/sys-img/android/sysimg_armv7a-16_r04.zip"
    SHA1
    39c093ea755098f0ee79f607be7df9e54ba4943f
)

hunter_add_version(
    PACKAGE_NAME
    Android-ARM-EABI-v7a-System-Image
    VERSION
    "19_r05"
    URL
    "https://dl.google.com/android/repository/sys-img/android/armeabi-v7a-19_r05.zip"
    SHA1
    d1a5fd4f2e1c013c3d3d9bfe7e9db908c3ed56fa
)

hunter_add_version(
    PACKAGE_NAME
    Android-ARM-EABI-v7a-System-Image
    VERSION
    "21_r04"
    URL
    "https://dl.google.com/android/repository/sys-img/android/armeabi-v7a-21_r04.zip"
    SHA1
    8c606f81306564b65e41303d2603e4c42ded0d10
)

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME Android-ARM-EABI-v7a-System-Image)
