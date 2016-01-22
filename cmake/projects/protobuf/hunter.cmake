# Copyright (c) 2014-2015, David Linten
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_PROTOBUF_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_PROTOBUF_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    protobuf
    VERSION
    "v3.0.0-hunter-p1"
    URL
    "https://github.com/dlinten/protobuf/archive/v3.0.0-hunter-p1.tar.gz"
    SHA1
    80dfa0cf7f3e1eb25736043a0a233d82478fdcfa
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(protobuf)
hunter_download(PACKAGE_NAME protobuf)
