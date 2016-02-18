# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_ALLTHEFLOPSTHREADS_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ALLTHEFLOPSTHREADS_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    AllTheFlopsThreads
    VERSION
    0.1-p0
    URL
    "https://github.com/hunter-packages/alltheflops-threads/archive/v0.1-p0.tar.gz"
    SHA1
    f8cbbdcbaf758da584de2d2388fd8818c236c682
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(AllTheFlopsThreads)
hunter_download(PACKAGE_NAME AllTheFlopsThreads)
