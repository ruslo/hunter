# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# https://dl.google.com/android/repository/repository-10.xml
# https://dl.google.com/android/repository/repository-11.xml

if(CMAKE_HOST_APPLE)
  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Platform-tools
      VERSION
      "r25.0.5"
      URL
      "http://dl-ssl.google.com/android/repository/platform-tools_r25.0.5-darwin.zip"
      SHA1
      9bbf65f80b05303a3576682d3350b087c4802283
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Platform-tools
      VERSION
      "r23.1.0"
      URL
      "http://dl-ssl.google.com/android/repository/platform-tools_r23.1.0-macosx.zip"
      SHA1
      ae617adb1f55c7f3c909b247d39ef9e58d3cf7f2
  )

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
      "r25.0.5"
      URL
      "http://dl-ssl.google.com/android/repository/platform-tools_r25.0.5-linux.zip"
      SHA1
      4c026e2445e8b898cb0fd5dedf710a666a78aaa7
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Platform-tools
      VERSION
      "r23.1.0"
      URL
      "http://dl-ssl.google.com/android/repository/platform-tools_r23.1.0-linux.zip"
      SHA1
      90d5555035be2dfa3be691403ef8f3bc75c258b7
  )

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
      "r25.0.5"
      URL
      "http://dl-ssl.google.com/android/repository/platform-tools_r25.0.5-windows.zip"
      SHA1
      a59b3747414e3002e826f84470dc1a7ceeb1c6d4
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Platform-tools
      VERSION
      "r23.1.0"
      URL
      "http://dl-ssl.google.com/android/repository/platform-tools_r23.1.0-windows.zip"
      SHA1
      787bd06180525ff94602fa8c45ccf25b8699e8f7
  )

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
