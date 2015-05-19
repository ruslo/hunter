# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_ANDROID_SDK_PLATFORM_TOOLS_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ANDROID_SDK_PLATFORM_TOOLS_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

if(APPLE)
  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Platform-tools
      VERSION
      "r22"
      URL
      "http://dl-ssl.google.com/android/repository/platform-tools_r22-macosx.zip"
      SHA1
      ddc96385bccf8a15d4f8a11eb1cb9d2a08a531c8
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Platform-tools
      VERSION
      "r21"
      URL
      "http://dl-ssl.google.com/android/repository/platform-tools_r21-macosx.zip"
      SHA1
      6675f9f583841972c5c5ef8d2c131e1209529fde
  )
elseif(UNIX)
  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Platform-tools
      VERSION
      "r22"
      URL
      "http://dl-ssl.google.com/android/repository/platform-tools_r22-linux.zip"
      SHA1
      b78be9cc31cf9f9fe0609e29a6a133beacf03b52
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Platform-tools
      VERSION
      "r21"
      URL
      "http://dl-ssl.google.com/android/repository/platform-tools_r21-linux.zip"
      SHA1
      2502ade68af9f6288c4dd7726796599e8d9a4337
  )
elseif(WIN32)
  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Platform-tools
      VERSION
      "r22"
      URL
      "http://dl-ssl.google.com/android/repository/platform-tools_r22-windows.zip"
      SHA1
      720214bd29d08eb82673cd81a8159b083eef19d7
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Platform-tools
      VERSION
      "r21"
      URL
      "http://dl-ssl.google.com/android/repository/platform-tools_r21-windows.zip"
      SHA1
      04b26e60e47cda4867d321817270058c22572352
  )
endif()

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME Android-SDK-Platform-tools)
