# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_CPPNETLIB_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_CPPNETLIB_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version_start(CppNetlib)

hunter_add_version(
    PACKAGE_NAME
    CppNetlib
    VERSION
    "0.10.1-hunter-1"
    URL
    "https://github.com/hunter-packages/cpp-netlib/archive/v0.10.1-hunter-1.tar.gz"
    SHA1
    fca9bb6d77162b6c3e5d822a46d4bb311e864592
)

hunter_pick_scheme(
    DEFAULT
    url_sha1_release_debug
    COMBINED
    url_sha1_combined_release_debug
)

hunter_download(PACKAGE_NAME CppNetlib)
