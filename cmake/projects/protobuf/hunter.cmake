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
    "2.6.0-rc1-hunter-1"
    URL
    "https://github.com/google/protobuf/archive/master.tar.gz"
    SHA1
    40ac3a5f3a7235b4d7b8a3d0556482473b2f1d4d
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(protobuf
hunter_download(PACKAGE_NAME protobuf)
