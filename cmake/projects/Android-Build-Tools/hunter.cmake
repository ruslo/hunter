# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_ANDROID_BUILD_TOOLS_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ANDROID_BUILD_TOOLS_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

if(APPLE)
  hunter_add_version(
      PACKAGE_NAME
      Android-Build-Tools
      VERSION
      "18.1"
      URL
      "https://dl-ssl.google.com/android/repository/build-tools_r18.1-macosx.zip"
      SHA1
      16ddb299b8b43063e5bb3387ec17147c5053dfd8
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-Build-Tools
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
      Android-Build-Tools
      VERSION
      "18.1"
      URL
      "https://dl-ssl.google.com/android/repository/build-tools_r18.1-linux.zip"
      SHA1
      f314a0599e51397f0886fe888b50dd98f2f050d8
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-Build-Tools
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
      Android-Build-Tools
      VERSION
      "18.1"
      URL
      "https://dl-ssl.google.com/android/repository/build-tools_r18.1-windows.zip"
      SHA1
      3a9810fc8559ab03c09378f07531e8cae2f1db30
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-Build-Tools
      VERSION
      "18.0.1"
      URL
      "https://dl-ssl.google.com/android/repository/build-tools_r18.0.1-windows.zip"
      SHA1
      a6c2afd0b6289d589351956d2f5212b37014ca7d
  )
endif()

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME Android-Build-Tools)
