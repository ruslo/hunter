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

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME Sources-for-Android-SDK)
