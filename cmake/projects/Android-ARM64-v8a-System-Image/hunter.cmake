# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# https://dl.google.com/android/repository/sys-img/android/sys-img.xml

hunter_add_version(
    PACKAGE_NAME
    Android-ARM64-v8a-System-Image
    VERSION
    24_r07
    URL
    "https://dl.google.com/android/repository/sys-img/android/arm64-v8a-24_r07.zip"
    SHA1
    e8ab2e49e4efe4b064232b33b5eeaded61437d7f
)

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME Android-ARM64-v8a-System-Image)
