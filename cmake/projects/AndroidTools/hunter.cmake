# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_ANDROIDTOOLS_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ANDROIDTOOLS_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

if(APPLE)
  hunter_add_version(
      PACKAGE_NAME
      AndroidTools
      VERSION
      "23.0.5"
      URL
      "http://dl-ssl.google.com/android/repository/tools_r23.0.5-macosx.zip"
      SHA1
      a567215d89b3ff80766e54f8f969b3487bce8d71
  )
elseif(UNIX)
  hunter_add_version(
      PACKAGE_NAME
      AndroidTools
      VERSION
      "23.0.5"
      URL
      "http://dl-ssl.google.com/android/repository/tools_r23.0.5-linux.zip"
      SHA1
      398c38494d50d98dd9f3ae02899ba32be32c912d
  )
elseif(WIN32)
  hunter_add_version(
      PACKAGE_NAME
      AndroidTools
      VERSION
      "23.0.5"
      URL
      "http://dl-ssl.google.com/android/repository/tools_r23.0.5-windows.zip"
      SHA1
      6df44dbc604ceccadda0a232b787868fb4503cb6
  )
endif()

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME AndroidTools)
