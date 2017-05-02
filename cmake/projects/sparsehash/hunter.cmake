#
# hunter.cmake for sparsehash/
#
# Copyright 2015, Aaditya Kalsi
#

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load modules used
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_report_broken_package)

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

hunter_report_broken_package(
    "'sparsehash' package is destructive (https://github.com/ruslo/hunter/issues/695)"
)

# This is header-only, so only headers are needed
hunter_download(PACKAGE_NAME sparsehash)
