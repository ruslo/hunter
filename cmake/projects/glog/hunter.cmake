# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_GLOG_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_GLOG_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    glog
    VERSION
    "0.3.4-p0"
    URL
    "https://github.com/ruslo/glog/archive/v0.3.4-p0.tar.gz"
    SHA1
    de92243289267cb0f0f971a9aedf21bba74b71b3
)

hunter_add_version(
    PACKAGE_NAME
    glog
    VERSION
    "0.3.4-p1"
    URL
    "https://github.com/hunter-packages/glog/archive/v0.3.4-p1.tar.gz"
    SHA1
    512b8ad6d9aae9499cca2e4c4530b9386cb05440
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(glog)
hunter_download(PACKAGE_NAME glog)
