# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# From: https://dl.google.com/android/repository/sys-img/google_apis/sys-img.xml

# Version should match regex '[0-9]+_r[0-9]+'
# Used by https://github.com/hunter-packages/android-sdk

hunter_add_version(
    PACKAGE_NAME
    Android-Google-APIs-Intel-x86-Atom-System-Image
    VERSION
    "22_r01"
    URL
    "https://dl.google.com/android/repository/sys-img/google_apis/sysimg_x86-22_r01.zip"
    SHA1
    4d18a23357af30a7df9a8f5f31b7dc3f4d1f74b2
)

hunter_add_version(
    PACKAGE_NAME
    Android-Google-APIs-Intel-x86-Atom-System-Image
    VERSION
    "21_r10"
    URL
    "https://dl.google.com/android/repository/sys-img/google_apis/sysimg_x86-21_r10.zip"
    SHA1
    c218fba49110dcc811d24bc170af8863c6253f8f
)

hunter_add_version(
    PACKAGE_NAME
    Android-Google-APIs-Intel-x86-Atom-System-Image
    VERSION
    "21_r09"
    URL
    "https://dl.google.com/android/repository/sys-img/google_apis/sysimg_x86-21_r09.zip"
    SHA1
    b6a979f63c72e88142ea449b906e443f986a12cf
)

hunter_add_version(
    PACKAGE_NAME
    Android-Google-APIs-Intel-x86-Atom-System-Image
    VERSION
    "22_r21"
    URL
    "https://dl.google.com/android/repository/sys-img/google_apis/x86-22_r21.zip"
    SHA1
    bef3c76ecb61b7e1a8d483d83a7ca9852f47a7ab
)

hunter_add_version(
    PACKAGE_NAME
    Android-Google-APIs-Intel-x86-Atom-System-Image
    VERSION
    "24_r20"
    URL
    "https://dl.google.com/android/repository/sys-img/google_apis/x86-24_r20.zip"
    SHA1
    c86cadee4e835eef8246bede3269133d06f34571
)

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME Android-Google-APIs-Intel-x86-Atom-System-Image)
