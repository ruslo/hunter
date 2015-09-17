# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_SPDLOG_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_SPDLOG_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    spdlog
    VERSION
    "1.0.0-p0"
    URL
    "https://github.com/hunter-packages/spdlog/archive/v1.0.0-p0.tar.gz"
    SHA1
    4d9967d165fc7ea2d561210bec2f50e60547daa6
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(spdlog)
hunter_download(PACKAGE_NAME spdlog)
