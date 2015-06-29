# Copyright (c) 2014-2015, Oliver Daniell
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_rabbitmq-c_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_rabbitmq-c_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    rabbitmq-c
    VERSION
    "0.7.0"
    URL
    "https://github.com/oliverdaniell/rabbitmq-c/archive/v0.7.0-hunter.tar.gz"
    SHA1
    e0b789bf6cafe44ffe7dd6fbfc182ab2422ad1ea
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(rabbitmq-c)
hunter_download(PACKAGE_NAME rabbitmq-c)
