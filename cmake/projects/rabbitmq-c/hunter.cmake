# Copyright (c) 2014-2015, Oliver Daniell
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_RABBITMQ_C_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_RABBITMQ_C_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    rabbitmq-c
    VERSION
    "0.7.0-p1"
    URL
    "https://github.com/oliverdaniell/rabbitmq-c/archive/v0.7.0-hunter-p1.tar.gz"
    SHA1
    89ba52ea76eb615fdbdb5aafa2a2b5037e67c303
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME rabbitmq-c)
