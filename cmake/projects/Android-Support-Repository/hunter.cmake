# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_ANDROID_SUPPORT_REPOSITORY_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ANDROID_SUPPORT_REPOSITORY_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# https://dl.google.com/android/repository/addon.xml

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
