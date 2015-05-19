# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_ANDROID_GOOGLE_APIS_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ANDROID_GOOGLE_APIS_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# From: https://dl.google.com/android/repository/addon.xml

hunter_add_version(
    PACKAGE_NAME
    Android-Google-APIs
    VERSION
    "22" # version affects layout: <sdk>/add-ons/addon-google_apis-google-22
    URL
    "https://dl.google.com/android/repository/google_apis-22_r01.zip"
    SHA1
    5def0f42160cba8acff51b9c0c7e8be313de84f5
)

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME Android-Google-APIs)
