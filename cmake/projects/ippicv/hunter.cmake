# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_IPPICV_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_IPPICV_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

if(APPLE)
  hunter_add_version(
      PACKAGE_NAME
      ippicv
      VERSION
      "20141027"
      URL
      "http://sourceforge.net/projects/opencvlibrary/files/3rdparty/ippicv/ippicv_macosx_20141027.tgz"
      SHA1
      b020d2d10e01f5b8d95f148bda5af4e24e52a3d2
  )
elseif(UNIX)
  hunter_add_version(
      PACKAGE_NAME
      ippicv
      VERSION
      "20141027"
      URL
      "http://sourceforge.net/projects/opencvlibrary/files/3rdparty/ippicv/ippicv_linux_20141027.tgz"
      SHA1
      64a39f85206c0da05880df364955729fbdefbac6
  )
elseif(WIN32)
  hunter_add_version(
      PACKAGE_NAME
      ippicv
      VERSION
      "20141027"
      URL
      "http://sourceforge.net/projects/opencvlibrary/files/3rdparty/ippicv/ippicv_windows_20141027.zip"
      SHA1
      6722cb73ab815f61f103b87114d44d93f8f9d3ba
  )
endif()

hunter_pick_scheme(DEFAULT url_sha1_download)
hunter_download(PACKAGE_NAME ippicv)
