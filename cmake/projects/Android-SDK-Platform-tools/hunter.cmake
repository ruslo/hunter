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

if(CMAKE_HOST_APPLE)
  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Platform-tools
      VERSION
      "r23.0.1"
      URL
      "http://dl-ssl.google.com/android/repository/platform-tools_r23.0.1-macosx.zip"
      SHA1
      c461d66f3ca9fbae8ea0fa1a49c203b3b6fd653f
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Platform-tools
      VERSION
      "r23"
      URL
      "http://dl-ssl.google.com/android/repository/platform-tools_r23-macosx.zip"
      SHA1
      1403fa0d1bb57ec31170d7905e8505e3b0ed05ee
  )

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
elseif(CMAKE_HOST_UNIX)
  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Platform-tools
      VERSION
      "r23.0.1"
      URL
      "http://dl-ssl.google.com/android/repository/platform-tools_r23.0.1-linux.zip"
      SHA1
      94dcc5072b3d0d74cc69e4101958b6c2e227e738
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Platform-tools
      VERSION
      "r23"
      URL
      "http://dl-ssl.google.com/android/repository/platform-tools_r23-linux.zip"
      SHA1
      31078104e5927d823c28550c01275c437a87def7
  )

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
elseif(CMAKE_HOST_WIN32)
  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Platform-tools
      VERSION
      "r23.0.1"
      URL
      "http://dl-ssl.google.com/android/repository/platform-tools_r23.0.1-windows.zip"
      SHA1
      8f32d5f724618ad58e71909cc963ae006d0867b0
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Platform-tools
      VERSION
      "r23"
      URL
      "http://dl-ssl.google.com/android/repository/platform-tools_r23-windows.zip"
      SHA1
      52b4816990d2d18a34645bbf20a31b38a7859d4c
  )

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
