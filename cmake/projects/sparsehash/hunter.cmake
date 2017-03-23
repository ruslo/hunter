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

# Version list
hunter_add_version(
  PACKAGE_NAME
  sparsehash
  VERSION
  "2.0.2"
  URL
  https://github.com/aadityakalsi/sparsehash/archive/v2.0.2-hunter.tar.gz
  SHA1
  24e725a008d065ec84c8f2a2bdbb5708dab162ac
)

# Default CMake scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)

# This is header-only, so only headers are needed
hunter_download(PACKAGE_NAME sparsehash)
