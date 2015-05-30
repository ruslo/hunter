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

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME Sources-for-Android-SDK)
