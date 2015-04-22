# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_INT_SIZEOF_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_INT_SIZEOF_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    IntSizeof
    VERSION
    "1.0.0"
    URL
    "https://github.com/ruslo/intsizeof/archive/v1.0.0.tar.gz"
    SHA1
    9959e0e29c88fe414ba082fb28a722e411682bb3
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME IntSizeof)
