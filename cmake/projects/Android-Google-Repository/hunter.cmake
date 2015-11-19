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

# https://dl.google.com/android/repository/addon.xml

hunter_add_version(
    PACKAGE_NAME
    Android-Google-Repository
    VERSION
    "23"
    URL
    "https://dl.google.com/android/repository/google_m2repository_r23.zip"
    SHA1
    c1b67b7e5b10d46dcffd3b2c560ead6d24f8224d
)

hunter_add_version(
    PACKAGE_NAME
    Android-Google-Repository
    VERSION
    "19"
    URL
    "https://dl.google.com/android/repository/google_m2repository_r19.zip"
    SHA1
    09f4445d0e2572e514de60615bc0cc3a7d391558
)

hunter_add_version(
    PACKAGE_NAME
    Android-Google-Repository
    VERSION
    "18"
    URL
    "https://dl.google.com/android/repository/google_m2repository_r18.zip"
    SHA1
    fa37e64775ffe5dc78c41364fb665406e88951c2
)

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
