# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_SPDLOG_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_SPDLOG_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    log4cplus
    VERSION
    "1.2.0-p0"
    URL
    "https://github.com/hunter-packages/log4cplus/archive/v1.2.0-p0.tar.gz"
    SHA1
    86950f3b471e2115972cba85aa548c41597664c4
)

if(ANDROID)
  set(_extra_args ANDROID_FUNCTION_LEVEL_LINKING=OFF)
else()
  set(_extra_args "")
endif()

hunter_cmake_args(
    log4cplus
    CMAKE_ARGS
        LOG4CPLUS_BUILD_TESTING=OFF
        LOG4CPLUS_BUILD_LOGGINGSERVER=OFF
        LOG4CPLUS_ENABLE_DECORATED_LIBRARY_NAME=OFF
        ${_extra_args}
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(log4cplus)
hunter_download(PACKAGE_NAME log4cplus)
