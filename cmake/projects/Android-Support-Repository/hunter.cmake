# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# https://dl.google.com/android/repository/addon.xml

hunter_add_version(
    PACKAGE_NAME
    Android-Support-Repository
    VERSION
    "47"
    URL
    "http://dl-ssl.google.com/android/repository/android_m2repository_r47.zip"
    SHA1
    a0d22beacc106a6977321f2b07d692ce4979e96a
)

hunter_add_version(
    PACKAGE_NAME
    Android-Support-Repository
    VERSION
    "28"
    URL
    "http://dl-ssl.google.com/android/repository/android_m2repository_r28.zip"
    SHA1
    e4d0ad49df085a8d0322cfc4cfaa5e74a7b0569b
)

hunter_add_version(
    PACKAGE_NAME
    Android-Support-Repository
    VERSION
    "25"
    URL
    "http://dl-ssl.google.com/android/repository/android_m2repository_r25.zip"
    SHA1
    c6f912c0996c0a805deb4158e63c3cd615470f78
)

hunter_add_version(
    PACKAGE_NAME
    Android-Support-Repository
    VERSION
    "16"
    URL
    "http://dl-ssl.google.com/android/repository/android_m2repository_r16.zip"
    SHA1
    c9bca7dbdd7b654ed471069ecb364a2b5683b07c
)

hunter_add_version(
    PACKAGE_NAME
    Android-Support-Repository
    VERSION
    "15"
    URL
    "http://dl-ssl.google.com/android/repository/android_m2repository_r15.zip"
    SHA1
    2c51feb406ce3c7e09db8339a0d680beb91b8bf1
)

hunter_add_version(
    PACKAGE_NAME
    Android-Support-Repository
    VERSION
    "14"
    URL
    "http://dl-ssl.google.com/android/repository/android_m2repository_r14.zip"
    SHA1
    0011dfe1473ccdfb1a533a19cad152c59dcd6b45
)

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME Android-Support-Repository)
