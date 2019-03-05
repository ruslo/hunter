# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# https://dl.google.com/android/repository/sys-img/android/sys-img.xml

hunter_add_version(
    PACKAGE_NAME
    Android-Intel-x86-Atom-System-Image
    VERSION
    "22"
    URL
    "https://dl.google.com/android/repository/sys-img/android/sysimg_x86-22_r01.zip"
    SHA1
    6c7bb51e41a16099bb1f2a3cc81fdb5aa053fc15
)

hunter_add_version(
    PACKAGE_NAME
    Android-Intel-x86-Atom-System-Image
    VERSION
    "22_r06"
    URL
    "https://dl.google.com/android/repository/sys-img/android/x86-22_r06.zip"
    SHA1
    e33e2a6cc3f1cc56b2019dbef3917d2eeb26f54e
)

hunter_add_version(
    PACKAGE_NAME
    Android-Intel-x86-Atom-System-Image
    VERSION
    "21"
    URL
    "https://dl.google.com/android/repository/sys-img/android/sysimg_x86-21_r03.zip"
    SHA1
    a0b510c66769e84fa5e40515531be2d266a4247f
)

hunter_add_version(
    PACKAGE_NAME
    Android-Intel-x86-Atom-System-Image
    VERSION
    "21_r04"
    URL
    "https://dl.google.com/android/repository/sys-img/android/sysimg_x86-21_r04.zip"
    SHA1
    3b78ad294aa1cdefa4be663d4af6c80d920ec49e
)

hunter_add_version(
    PACKAGE_NAME
    Android-Intel-x86-Atom-System-Image
    VERSION
    "21_r05"
    URL
    "https://dl.google.com/android/repository/sys-img/android/x86-21_r05.zip"
    SHA1
    00f0eb0a1003efe3316347f762e20a85d8749cff
)

hunter_add_version(
    PACKAGE_NAME
    Android-Intel-x86-Atom-System-Image
    VERSION
    "19"
    URL
    "https://dl.google.com/android/repository/sys-img/android/sysimg_x86-19_r03.zip"
    SHA1
    3782f3ebac5e54b3de454570add401989515ffca
)

hunter_add_version(
    PACKAGE_NAME
    Android-Intel-x86-Atom-System-Image
    VERSION
    "16"
    URL
    "https://dl.google.com/android/repository/sys-img/android/sysimg_x86-16_r02.zip"
    SHA1
    36c2a2e394bcb3290583ce09815eae7711d0b2c2
)

hunter_add_version(
    PACKAGE_NAME
    Android-Intel-x86-Atom-System-Image
    VERSION
    "24_r08"
    URL
    "https://dl.google.com/android/repository/sys-img/android/x86-24_r08.zip"
    SHA1
    c1cae7634b0216c0b5990f2c144eb8ca948e3511
)

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME Android-Intel-x86-Atom-System-Image)
