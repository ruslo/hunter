# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_ANDROID_SDK_PLATFORM_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ANDROID_SDK_PLATFORM_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# https://dl.google.com/android/repository/repository-10.xml

hunter_add_version(
    PACKAGE_NAME
    Android-SDK-Platform
    VERSION
    "22_r02"
    URL
    "http://dl-ssl.google.com/android/repository/android-22_r02.zip"
    SHA1
    5d1bd10fea962b216a0dece1247070164760a9fc
)

hunter_add_version(
    PACKAGE_NAME
    Android-SDK-Platform
    VERSION
    "21_r02"
    URL
    "http://dl-ssl.google.com/android/repository/android-21_r02.zip"
    SHA1
    53536556059bb29ae82f414fd2e14bc335a4eb4c
)

hunter_add_version(
    PACKAGE_NAME
    Android-SDK-Platform
    VERSION
    "21_r01"
    URL
    "http://dl-ssl.google.com/android/repository/android-21_r01.zip"
    SHA1
    218ca22f8cb744396fa11e65b8a3d2d1ae07f10e
)

hunter_add_version(
    PACKAGE_NAME
    Android-SDK-Platform
    VERSION
    "19_r04"
    URL
    "http://dl-ssl.google.com/android/repository/android-19_r04.zip"
    SHA1
    2ff20d89e68f2f5390981342e009db5a2d456aaa
)

hunter_add_version(
    PACKAGE_NAME
    Android-SDK-Platform
    VERSION
    "16_r05"
    URL
    "http://dl-ssl.google.com/android/repository/android-16_r05.zip"
    SHA1
    12a5ce6235a76bc30f62c26bda1b680e336abd07
)

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME Android-SDK-Platform)
