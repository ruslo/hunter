# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_ANDROID_INTEL_X86_ATOM_SYSTEM_IMAGE_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ANDROID_INTEL_X86_ATOM_SYSTEM_IMAGE_CMAKE_ 1)
endif()

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

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME Android-Intel-x86-Atom-System-Image)
