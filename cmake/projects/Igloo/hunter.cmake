# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_IGLOO_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_IGLOO_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version_start(Igloo)

hunter_add_version(
    PACKAGE_NAME
    Igloo
    VERSION
    "1.1.1-hunter"
    URL
    "https://github.com/hunter-packages/igloo/archive/v1.1.1-hunter.tar.gz"
    SHA1
    c814809c68d90d3554aa17f4f4de72b85cdc83ec
)

hunter_pick_scheme(
    DEFAULT
    url_sha1_release_debug
    COMBINED
    url_sha1_combined_release_debug
)

hunter_download(PACKAGE_NAME Igloo)
