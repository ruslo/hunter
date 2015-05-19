# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_ANDROID_SDK_BUILD_TOOLS_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ANDROID_SDK_BUILD_TOOLS_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

if(APPLE)
  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Build-tools
      VERSION
      "18.0.1"
      URL
      "https://dl-ssl.google.com/android/repository/build-tools_r18.0.1-macosx.zip"
      SHA1
      d84f5692fb44d60fc53e5b2507cebf9f24626902
  )
elseif(UNIX)
  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Build-tools
      VERSION
      "18.0.1"
      URL
      "https://dl-ssl.google.com/android/repository/build-tools_r18.0.1-linux.zip"
      SHA1
      f11618492b0d2270c332325d45d752d3656a9640
  )
elseif(WIN32)
  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Build-tools
      VERSION
      "18.0.1"
      URL
      "https://dl-ssl.google.com/android/repository/build-tools_r18.0.1-windows.zip"
      SHA1
      a6c2afd0b6289d589351956d2f5212b37014ca7d
  )
endif()

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME Android-SDK-Build-tools)
