# Copyright (c) 2014-2015, David Linten
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_JSON_SPIRIT_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_JSON_SPIRIT_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    JSONSpirit
    VERSION
    "4.8.0"
    URL
    "https://github.com/dlinten/json_spirit/archive/master.tar.gz"
    SHA1
    5cca725566013f3424c751711671ede7fab263d4
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME JSONSpirit)
