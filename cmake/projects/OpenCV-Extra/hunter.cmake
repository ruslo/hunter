# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_OPENCV_EXTRA_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_OPENCV_EXTRA_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    OpenCV-Extra
    VERSION
    "3.0.0"
    URL
    "https://github.com/Itseez/opencv_contrib/archive/3.0.0.tar.gz"
    SHA1
    6301ce49ec0c851837b62aed8592be9cd9309f79
)

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME OpenCV-Extra)
