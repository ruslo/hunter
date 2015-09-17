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

hunter_add_version(
    PACKAGE_NAME
    Android-Google-APIs
    VERSION
    "21" # version affects layout: <sdk>/add-ons/addon-google_apis-google-21
    URL
    "https://dl.google.com/android/repository/google_apis-21_r01.zip"
    SHA1
    66a754efb24e9bb07cc51648426443c7586c9d4a
)

hunter_add_version(
    PACKAGE_NAME
    Android-Google-APIs
    VERSION
    "19" # version affects layout: <sdk>/add-ons/addon-google_apis-google-19
    URL
    "https://dl.google.com/android/repository/google_apis-19_r14.zip"
    SHA1
    cb053798e862c0f674ef909aa58218f07d277d18
)

hunter_add_version(
    PACKAGE_NAME
    Android-Google-APIs
    VERSION
    "16" # version affects layout: <sdk>/add-ons/addon-google_apis-google-16
    URL
    "https://dl.google.com/android/repository/google_apis-16_r04.zip"
    SHA1
    ee6acf1b01020bfa8a8e24725dbc4478bee5e792
)

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME Android-Google-APIs)
