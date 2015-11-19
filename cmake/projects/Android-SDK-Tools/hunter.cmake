# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_ANDROID_SDK_TOOLS_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ANDROID_SDK_TOOLS_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# http://dl-ssl.google.com/android/repository/repository-10.xml

if(CMAKE_HOST_APPLE)
  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Tools
      VERSION
      "24.4.1"
      URL
      "http://dl-ssl.google.com/android/repository/tools_r24.4.1-macosx.zip"
      SHA1
      90db74e1827846b0e946a26d22a4314f8cfa3701
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Tools
      VERSION
      "24.3.3"
      URL
      "http://dl-ssl.google.com/android/repository/tools_r24.3.3-macosx.zip"
      SHA1
      97b48b818ee596593da7f753e58307069a37f6b8
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Tools
      VERSION
      "24.3"
      URL
      "http://dl-ssl.google.com/android/repository/tools_r24.3-macosx.zip"
      SHA1
      3fbbdc8403558f3d7c08a35ae991f8e6342d77cf
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Tools
      VERSION
      "24.2"
      URL
      "http://dl-ssl.google.com/android/repository/tools_r24.2-macosx.zip"
      SHA1
      bae733afb4b024fdcbdaad1105d4dedf5689454f
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Tools
      VERSION
      "23.0.5"
      URL
      "http://dl-ssl.google.com/android/repository/tools_r23.0.5-macosx.zip"
      SHA1
      a567215d89b3ff80766e54f8f969b3487bce8d71
  )
elseif(CMAKE_HOST_UNIX)
  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Tools
      VERSION
      "24.4.1"
      URL
      "http://dl-ssl.google.com/android/repository/tools_r24.4.1-linux.zip"
      SHA1
      7e00ea3715f2cf666296ce22058764ec7ecb3b7e
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Tools
      VERSION
      "24.3.3"
      URL
      "http://dl-ssl.google.com/android/repository/tools_r24.3.3-linux.zip"
      SHA1
      c2c6f6236cbee34c80ec6b5f9f6b7bf0bc5919cb
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Tools
      VERSION
      "24.3"
      URL
      "http://dl-ssl.google.com/android/repository/tools_r24.3-linux.zip"
      SHA1
      ecb86253e97cd14459888701fc3478b4d153a86c
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Tools
      VERSION
      "24.2"
      URL
      "http://dl-ssl.google.com/android/repository/tools_r24.2-linux.zip"
      SHA1
      4dd9d54af10eb999efe606899d3007cb6b1eaa78
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Tools
      VERSION
      "23.0.5"
      URL
      "http://dl-ssl.google.com/android/repository/tools_r23.0.5-linux.zip"
      SHA1
      398c38494d50d98dd9f3ae02899ba32be32c912d
  )
elseif(CMAKE_HOST_WIN32)
  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Tools
      VERSION
      "24.4.1"
      URL
      "http://dl-ssl.google.com/android/repository/tools_r24.4.1-windows.zip"
      SHA1
      4b16f8f109e49a11a36949fe781dc804d38a1a68
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Tools
      VERSION
      "24.3"
      URL
      "http://dl-ssl.google.com/android/repository/tools_r24.3.3-windows.zip"
      SHA1
      9aec685e03aaa8ebf9991502b5fda7db208693f1
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Tools
      VERSION
      "24.3"
      URL
      "http://dl-ssl.google.com/android/repository/tools_r24.3-windows.zip"
      SHA1
      a8fd4332b5c9288f663d28bd5bb8076d933f76cd
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Tools
      VERSION
      "24.2"
      URL
      "http://dl-ssl.google.com/android/repository/tools_r24.2-windows.zip"
      SHA1
      a2d6b9e00516c63455d17fae9c9fe2463f4389a1
  )

  hunter_add_version(
      PACKAGE_NAME
      Android-SDK-Tools
      VERSION
      "23.0.5"
      URL
      "http://dl-ssl.google.com/android/repository/tools_r23.0.5-windows.zip"
      SHA1
      6df44dbc604ceccadda0a232b787868fb4503cb6
  )
endif()

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME Android-SDK-Tools)
