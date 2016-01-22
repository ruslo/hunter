# Copyright (c) 2014-2015, David Linten
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_JSON_SPIRIT_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_JSON_SPIRIT_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    json_spirit
    VERSION
    "v4.08"
    URL
    "https://github.com/dlinten/json_spirit/archive/master.tar.gz"
    SHA1
    10fcc59d8eace6b8861920d52e08a22a821294c5
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(json_spirit)
hunter_download(PACKAGE_NAME json_spirit)
