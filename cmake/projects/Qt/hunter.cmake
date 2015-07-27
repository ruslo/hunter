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

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.0"
    URL
    "http://download.qt.io/official_releases/qt/5.5/5.5.0/single/qt-everywhere-opensource-src-5.5.0.tar.gz"
    SHA1
    5a11602e781ef3160965dce9e959b2d4f93e6def
)

hunter_cacheable(Qt)

if(NOT APPLE)
  hunter_configuration_types(Qt CONFIGURATION_TYPES Release)
endif()

if(ANDROID)
  # Static variant is not supported: https://bugreports.qt.io/browse/QTBUG-47455
  hunter_cmake_args(Qt CMAKE_ARGS BUILD_SHARED_LIBS=ON)
endif()

include("${CMAKE_CURRENT_LIST_DIR}/qtbase/hunter.cmake")
