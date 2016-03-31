# Copyright (c) 2015, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

if(CMAKE_HOST_APPLE)
  hunter_add_version(
      PACKAGE_NAME
      odb-compiler
      VERSION
      "2.4.0"
      URL
      "http://www.codesynthesis.com/download/odb/2.4/odb-2.4.0-i686-macosx.tar.bz2"
      SHA1
      14d4972b43278b12479950b4a12affe4e4e500c1
  )
elseif(CMAKE_HOST_UNIX) # if Linux
  hunter_add_version(
      PACKAGE_NAME
      odb-compiler
      VERSION
      "2.4.0"
      URL
      "http://www.codesynthesis.com/download/odb/2.4/odb-2.4.0-x86_64-linux-gnu.tar.bz2"
      SHA1
      630882a3461a8aa6349fd5b4e5ef20ec9afae09d
  )
elseif(CMAKE_HOST_WIN32)
  hunter_add_version(
      PACKAGE_NAME
      odb-compiler
      VERSION
      "2.4.0"
      URL
      "http://www.codesynthesis.com/download/odb/2.4/odb-2.4.0-i686-windows.zip"
      SHA1
      386ae3dd284c20acfcb5a49ed42c2ff5c598e401
  )
endif()

hunter_pick_scheme(DEFAULT url_sha1_unpack_install)
hunter_download(PACKAGE_NAME odb-compiler)
