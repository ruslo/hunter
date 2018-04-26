# Copyright (c) 2015-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# https://dl.google.com/android/repository/sys-img/android/sys-img.xml

hunter_add_version(
    PACKAGE_NAME
    Android-MIPS-System-Image
    VERSION
    "16_r04"
    URL
    "https://dl.google.com/android/repository/sys-img/android/sysimg_mips-16_r04.zip"
    SHA1
    67943c54fb3943943ffeb05fdd39c0b753681f6e
)

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME Android-MIPS-System-Image)
