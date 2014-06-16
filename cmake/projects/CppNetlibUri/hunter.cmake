# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_CPPNETLIB_URI_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_CPPNETLIB_URI_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version_start(CppNetlibUri)

hunter_add_version(
    PACKAGE_NAME
    CppNetlibUri
    VERSION
    "1.0.1-hunter"
    URL
    "https://github.com/hunter-packages/uri/archive/v1.0.1-hunter.tar.gz"
    SHA1
    a1e05fb1b571532e407604e8a3ad04153ee63f75
)

hunter_add_version(
    PACKAGE_NAME
    CppNetlibUri
    VERSION
    "1.0.0-hunter"
    URL
    "https://github.com/hunter-packages/uri/archive/v1.0.0-hunter.tar.gz"
    SHA1
    c093562c2588c84749f2645f652c372655052c1c
)

hunter_pick_scheme(
    DEFAULT
    url_sha1_release_debug
    COMBINED
    url_sha1_combined_release_debug
)

hunter_download(PACKAGE_NAME CppNetlibUri)
