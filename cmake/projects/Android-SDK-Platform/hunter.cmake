# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_ANDROIDPLATFORM_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ANDROIDPLATFORM_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    AndroidPlatform
    VERSION
    "22_r02"
    URL
    "http://dl-ssl.google.com/android/repository/android-22_r02.zip"
    SHA1
    5d1bd10fea962b216a0dece1247070164760a9fc
)

hunter_add_version(
    PACKAGE_NAME
    AndroidPlatform
    VERSION
    "21_r01"
    URL
    "http://dl-ssl.google.com/android/repository/android-21_r01.zip"
    SHA1
    218ca22f8cb744396fa11e65b8a3d2d1ae07f10e
)

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME AndroidPlatform)
