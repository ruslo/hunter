# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_SOURCES_FOR_ANDROID_SDK_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_SOURCES_FOR_ANDROID_SDK_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# http://dl-ssl.google.com/android/repository/repository-10.xml

hunter_add_version(
    PACKAGE_NAME
    Sources-for-Android-SDK
    VERSION
    "22" # version affects layout: <sdk>/sources/android-22
    URL
    "http://dl-ssl.google.com/android/repository/sources-22_r01.zip"
    SHA1
    98320e13976d11597a4a730a8d203ac9a03ed5a6
)

hunter_add_version(
    PACKAGE_NAME
    Sources-for-Android-SDK
    VERSION
    "21" # version affects layout: <sdk>/sources/android-21
    URL
    "http://dl-ssl.google.com/android/repository/sources-21_r01.zip"
    SHA1
    137a5044915d32bea297a8c1552684802bbc2e25
)

hunter_add_version(
    PACKAGE_NAME
    Sources-for-Android-SDK
    VERSION
    "19" # version affects layout: <sdk>/sources/android-19
    URL
    "http://dl-ssl.google.com/android/repository/sources-19_r02.zip"
    SHA1
    433a1d043ef77561571250e94cb7a0ef24a202e7
)

hunter_add_version(
    PACKAGE_NAME
    Sources-for-Android-SDK
    VERSION
    "16" # version affects layout: <sdk>/sources/android-16
    URL
    "http://dl-ssl.google.com/android/repository/sources-16_r02.zip"
    SHA1
    0f83c14ed333c45d962279ab5d6bc98a0269ef84
)

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME Sources-for-Android-SDK)
