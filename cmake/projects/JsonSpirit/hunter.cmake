# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_JSON_SPIRIT_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_JSON_SPIRIT_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version_start(JsonSpirit)

hunter_add_version(
    PACKAGE_NAME
    JsonSpirit
    VERSION
    "0.0.1-hunter"
    URL
    "https://github.com/hunter-packages/json_spirit/archive/v0.0.1-hunter.tar.gz"
    SHA1
    9d789aa8329d9aae655c15feb8943c5e583eaa06
)

hunter_pick_scheme(
     DEFAULT
     url_sha1_release_debug
     COMBINED
     url_sha1_combined_release_debug
)

hunter_download(PACKAGE_NAME JsonSpirit)
