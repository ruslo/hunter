#
# hunter.cmake for sparsehash/
#
# Copyright 2015, Aaditya Kalsi
#

if(DEFINED HUNTER_CMAKE_PROJECTS_SPARSEHASH_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_SPARSEHASH_HUNTER_CMAKE_ 1)
endif()

# Load modules used
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# Version list
hunter_add_version(
  PACKAGE_NAME
  sparsehash
  VERSION
  "2.0.2"
  URL
  https://github.com/aadityakalsi/sparsehash/archive/sparsehash-2.0.2-cmake.tar.gz
  SHA1
  8fa7190fa2ad43218f91717be0bf151667773263
)

# Default CMake scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)

# This is header-only, so only headers are needed
hunter_download(PACKAGE_NAME sparsehash)
