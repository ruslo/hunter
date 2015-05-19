# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_ANDROID_GOOGLE_REPOSITORY_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ANDROID_GOOGLE_REPOSITORY_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Android-Google-Repository
    VERSION
    "17"
    URL
    "https://dl.google.com/android/repository/google_m2repository_r17.zip"
    SHA1
    a91a809149b69fab1efb4652c21b439e8b9e7150
)

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME Android-Google-Repository)
