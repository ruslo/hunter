# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# From: https://dl.google.com/android/repository/addon.xml

# Version should match regex '[0-9]+_r[0-9]+'
# Used by https://github.com/hunter-packages/android-sdk

hunter_add_version(
    PACKAGE_NAME
    Android-Google-APIs
    VERSION
    "22_r01"
    URL
    "https://dl.google.com/android/repository/google_apis-22_r01.zip"
    SHA1
    5def0f42160cba8acff51b9c0c7e8be313de84f5
)

hunter_add_version(
    PACKAGE_NAME
    Android-Google-APIs
    VERSION
    "21_r01"
    URL
    "https://dl.google.com/android/repository/google_apis-21_r01.zip"
    SHA1
    66a754efb24e9bb07cc51648426443c7586c9d4a
)

hunter_add_version(
    PACKAGE_NAME
    Android-Google-APIs
    VERSION
    "19_r18"
    URL
    "https://dl.google.com/android/repository/google_apis-19_r18.zip"
    SHA1
    701595b0d9985cca00be29b3c606e64731c3e1f7
)

hunter_add_version(
    PACKAGE_NAME
    Android-Google-APIs
    VERSION
    "16_r04"
    URL
    "https://dl.google.com/android/repository/google_apis-16_r04.zip"
    SHA1
    ee6acf1b01020bfa8a8e24725dbc4478bee5e792
)

hunter_add_version(
    PACKAGE_NAME
    Android-Google-APIs
    VERSION
    "22_r01"
    URL
    "https://dl.google.com/android/repository/google_apis-22_r01.zip"
    SHA1
    5def0f42160cba8acff51b9c0c7e8be313de84f5
)

hunter_add_version(
    PACKAGE_NAME
    Android-Google-APIs
    VERSION
    "24_r1"
    URL
    "https://dl.google.com/android/repository/google_apis-24_r1.zip"
    SHA1
    31361c2868f27343ee917fbd259c1463821b6145
)

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME Android-Google-APIs)
