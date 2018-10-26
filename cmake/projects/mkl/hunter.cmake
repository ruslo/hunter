# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_user_error)

if(WIN32)
  hunter_add_version(
      PACKAGE_NAME
      mkl
      VERSION
      20180406
      URL
      "https://github.com/intel/mkl-dnn/releases/download/v0.14/mklml_win_2018.0.3.20180406.zip"
      SHA1
      d607ca92d7bfc101f0828c0b005098b75531669b
  )
elseif(APPLE)
  hunter_add_version(
      PACKAGE_NAME
      mkl
      VERSION
      20180406
      URL
      "https://github.com/intel/mkl-dnn/releases/download/v0.14/mklml_mac_2018.0.3.20180406.tgz"
      SHA1
      d76083fd5a79767a96572ad0e23e7f4c892818f2
  )
elseif(UNIX)
  hunter_add_version(
      PACKAGE_NAME
      mkl
      VERSION
      20180406
      URL
      "https://github.com/intel/mkl-dnn/releases/download/v0.14/mklml_lnx_2018.0.3.20180406.tgz"
      SHA1
      aea0d9ce65773cfcf5d8292b8db553bde965fc8f
  )
else()
  hunter_user_error("Platform not supported")
endif()

hunter_pick_scheme(DEFAULT url_sha1_unpack_install)
hunter_download(PACKAGE_NAME mkl)
