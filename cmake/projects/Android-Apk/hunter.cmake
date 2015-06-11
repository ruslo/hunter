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
    "1.1.2"
    URL
    "https://github.com/headupinclouds/android-apk/archive/v1.1.2.tar.gz"
    SHA1
    f3ee7a7ac587451be00915da24f75fab6751d3fc
)

hunter_add_version(
    PACKAGE_NAME
    Android-Apk
    VERSION
    "1.1.1"
    URL
    "https://github.com/hunter-packages/android-apk/archive/v1.1.1.tar.gz"
    SHA1
    232618ab5785b97461bdcf7f09ad8c1e7bf00ec8
)

hunter_add_version(
    PACKAGE_NAME
    Android-Apk
    VERSION
    "1.1.0"
    URL
    "https://github.com/hunter-packages/android-apk/archive/v1.1.0.tar.gz"
    SHA1
    b0a500a00aecb28af81f41239f8bb0dc21d2870f
)

hunter_add_version(
    PACKAGE_NAME
    Android-Apk
    VERSION
    "1.0.1"
    URL
    "https://github.com/hunter-packages/android-apk/archive/v1.0.1.tar.gz"
    SHA1
    006c2ee85156540bbbe55f72825888b264db8aed
)

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
