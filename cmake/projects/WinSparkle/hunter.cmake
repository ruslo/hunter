# Copyright (c) 2015, Alexander Lamaison
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_WINSPARKLE_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_WINSPARKLE_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    WinSparkle
    VERSION
    "0.4.0"
    URL
    "https://github.com/alamaison/winsparkle/archive/v0.4-hunter-3.tar.gz"
    SHA1
    8e7790c93fe7ffeae529621a7fc93ea10e9d2af6
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)

hunter_download(PACKAGE_NAME WinSparkle)
