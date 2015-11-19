# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_ANDROID_GOOGLE_APIS_INTEL_X86_ATOM_SYSTEM_IMAGE_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ANDROID_GOOGLE_APIS_INTEL_X86_ATOM_SYSTEM_IMAGE_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# From: https://dl.google.com/android/repository/sys-img/google_apis/sys-img.xml

hunter_add_version(
    PACKAGE_NAME
    Android-Google-APIs-Intel-x86-Atom-System-Image
    VERSION
    "22" # version affect layout: <sdk>/system-images/android-22/google_apis/
    URL
    "https://dl.google.com/android/repository/sys-img/google_apis/sysimg_x86-22_r01.zip"
    SHA1
    4d18a23357af30a7df9a8f5f31b7dc3f4d1f74b2
)


hunter_add_version(
    PACKAGE_NAME
    Android-Google-APIs-Intel-x86-Atom-System-Image
    VERSION
    "21" # version affect layout: <sdk>/system-images/android-21/google_apis/
    URL
    "https://dl.google.com/android/repository/sys-img/google_apis/sysimg_x86-21_r09.zip"
    SHA1
    b6a979f63c72e88142ea449b906e443f986a12cf
)

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME Android-Google-APIs-Intel-x86-Atom-System-Image)
