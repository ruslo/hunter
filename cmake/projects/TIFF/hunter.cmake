# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_TIFF_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_TIFF_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    TIFF
    VERSION
    "4.0.2-hunter-2"
    URL
    "https://github.com/hunter-packages/tiff/archive/v4.0.2-hunter-2.tar.gz"
    SHA1
    a891cb185256925d983e87d664304c4b6ff31779
)

hunter_add_version(
    PACKAGE_NAME
    TIFF
    VERSION
    "4.0.2-hunter-1"
    URL
    "https://github.com/hunter-packages/tiff/archive/v4.0.2-hunter-1.tar.gz"
    SHA1
    9088be15b54257f227988e1b479b7394e944fe71
)

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
