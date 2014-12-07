# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_TIFF_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_TIFF_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version_start(TIFF)

hunter_add_version(
    PACKAGE_NAME
    TIFF
    VERSION
    "4.0.2"
    URL
    "https://github.com/hunter-packages/tiff/archive/v4.0.2.tar.gz"
    SHA1
    37c71656488797c4e5fde620570f1a1b9be36037
)

hunter_pick_scheme(
    DEFAULT url_sha1_release_debug
    COMBINED url_sha1_combined_release_debug
)

hunter_download(PACKAGE_NAME TIFF)
