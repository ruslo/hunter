# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_GSL_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_GSL_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version_start(GSL)

hunter_add_version(
    PACKAGE_NAME
    GSL
    VERSION
    "1.16"
    URL
    "https://github.com/ruslo/gsl/archive/v1.16.tar.gz"
    SHA1
    ce16e45c82191e351359ab30a2a77fcd21cbdb4c
)

hunter_pick_scheme(
    DEFAULT url_sha1_release_debug
    COMBINED url_sha1_combined_release_debug
)

hunter_download(PACKAGE_NAME GSL)
