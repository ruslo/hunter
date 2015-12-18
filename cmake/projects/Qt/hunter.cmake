# Copyright (c) 2015, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_QT_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_QT_HUNTER_CMAKE 1)
endif()

include(hunter_add_package)
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_report_broken_package)

# Use *.7z version.
# Qt 5.5 overview:
#   zip 540M
#   tar.gz 436M (don't have qtbase/configure.exe)
#   7z 297M
#   tar.xz 305M (don't have qtbase/configure.exe)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.0"
    URL
    "http://download.qt.io/official_releases/qt/5.5/5.5.0/single/qt-everywhere-opensource-src-5.5.0.7z"
    SHA1
    df2c0a7a20f219f921246b260df086600515955d
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.0-hunter-p0"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.0-p0/hunter-5.5.0.7z"
    SHA1
    a54e70921daba9dada49a2f0f05ce49a062d9d86
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.0-hunter-p1"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.0-p1/hunter-5.5.0.7z"
    SHA1
    b9f2a7bcb865bdeea51e1151f8d08c6a8c81e88a
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.1-hunter-p0"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.1-p0/hunter-5.5.1.7z"
    SHA1
    629170a8af91610c246ad27df56aa5afb687e7fd
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.1-hunter-p1"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.1-p1/v5.5.1-p1.7z"
    SHA1
    8485a9ecece177c9cc4369dc4bd4d726d4c60302
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.1-cvpixelbuffer-p0"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.1-cvpixelbuffer-p0/v5.5.1-cvpixelbuffer-p0.7z"
    SHA1
    6c077023b0b8a7402f04a46c5b90d4db99d74369
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.1-cvpixelbuffer-2-p0"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.1-cvpixelbuffer-2-p0/hunter-5.5.1-cvpixelbuffer-2.7z"
    SHA1
    4efb6c9c37db1846ec70f5fdcf2c719087451075
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.6.0-alpha"
    URL
    "http://download.qt.io/development_releases/qt/5.6/5.6.0-alpha/single/qt-everywhere-opensource-src-5.6.0-alpha.7z"
    SHA1
    d902b7df94219d2ed2f5c868839c85ce9daa056a
)

hunter_cacheable(Qt)

if(NOT APPLE AND NOT WIN32)
  hunter_configuration_types(Qt CONFIGURATION_TYPES Release)
endif()

if(ANDROID)
  # Static variant is not supported: https://bugreports.qt.io/browse/QTBUG-47455
  hunter_cmake_args(Qt CMAKE_ARGS BUILD_SHARED_LIBS=ON)
endif()

if(IOS)
  list(FIND IPHONEOS_ARCHS "armv7s" _armv7s_index)
  if(NOT _armv7s_index EQUAL -1)
    hunter_report_broken_package(
        "Some parts of Qt can't be built for armv7s."
        "For example Qt Multimedia: https://bugreports.qt.io/browse/QTBUG-48805"
    )
  endif()
endif()

include("${CMAKE_CURRENT_LIST_DIR}/qtbase/hunter.cmake")

hunter_add_package(QtCMakeExtra)
