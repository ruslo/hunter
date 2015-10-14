# Copyright (c) 2015, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_QT_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_QT_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)

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

include("${CMAKE_CURRENT_LIST_DIR}/qtbase/hunter.cmake")
