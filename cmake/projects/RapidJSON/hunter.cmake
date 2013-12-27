# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_RAPID_JSON_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_RAPID_JSON_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)

hunter_add_version_start(RapidJSON)

hunter_add_version(
    PACKAGE_NAME
    RapidJSON
    VERSION
    "0.11-hunter"
    URL
    "https://github.com/hunter-packages/rapidjson/archive/v0.11-hunter.tar.gz"
    SHA1
    3cae7f5043e2bfbeb83c033b90a1a9fb69fd2371
)

hunter_download(
    PACKAGE_NAME
    RapidJSON
    DOWNLOAD_SCHEME
    url_sha1_release_debug
)
