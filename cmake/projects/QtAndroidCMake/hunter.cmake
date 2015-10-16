# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_QTANDROIDCMAKE_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_QTANDROIDCMAKE_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    QtAndroidCMake
    VERSION
    "1.0.6"
    URL
    "https://github.com/hunter-packages/qt-android-cmake/archive/v1.0.6.tar.gz"
    SHA1
    312b2210017bc279ce08c2ecd212421cbb0389d8
)

hunter_add_version(
    PACKAGE_NAME
    QtAndroidCMake
    VERSION
    "1.0.5"
    URL
    "https://github.com/hunter-packages/qt-android-cmake/archive/v1.0.5.tar.gz"
    SHA1
    0c8ba91ce4a22a107d9c5590edc2b72e79cd8814
)

hunter_add_version(
    PACKAGE_NAME
    QtAndroidCMake
    VERSION
    "1.0.4"
    URL
    "https://github.com/hunter-packages/qt-android-cmake/archive/v1.0.4.tar.gz"
    SHA1
    e5c8bdd8668d972996731abf80bb14f24c3d765a
)

hunter_add_version(
    PACKAGE_NAME
    QtAndroidCMake
    VERSION
    "1.0.3"
    URL
    "https://github.com/hunter-packages/qt-android-cmake/archive/v1.0.3.tar.gz"
    SHA1
    18916f1a02cd7d90b1b5eee80bba85edaa068ad1
)

hunter_add_version(
    PACKAGE_NAME
    QtAndroidCMake
    VERSION
    "1.0.2"
    URL
    "https://github.com/hunter-packages/qt-android-cmake/archive/v1.0.2.tar.gz"
    SHA1
    f35ab2891c6f4ddae593c96896a95b514e0d314e
)

hunter_add_version(
    PACKAGE_NAME
    QtAndroidCMake
    VERSION
    "1.0.1"
    URL
    "https://github.com/hunter-packages/qt-android-cmake/archive/v1.0.1.tar.gz"
    SHA1
    fed89d21c0fe68c3644ea6815751ec4bdad42fdd
)

hunter_add_version(
    PACKAGE_NAME
    QtAndroidCMake
    VERSION
    "1.0.0"
    URL
    "https://github.com/hunter-packages/qt-android-cmake/archive/v1.0.0.tar.gz"
    SHA1
    48388837556e7d44cfbcc11370adf0932ce5453f
)

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME QtAndroidCMake)
