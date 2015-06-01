# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_ANDROID_APK_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ANDROID_APK_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Android-Apk
    VERSION
    "1.0.0"
    URL
    "https://github.com/hunter-packages/android-apk/archive/v1.0.0.tar.gz"
    SHA1
    f3ef23bdbacdc4881b2aaeadf433c87fee28ff04
)

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME Android-Apk)
