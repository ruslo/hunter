# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_CPPNETLIB_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_CPPNETLIB_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_package)
include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)
include(hunter_pick_scheme)

# Dependencies --
hunter_add_package(Boost)
hunter_add_package(OpenSSL)
hunter_add_package(Sugar)
if(APPLE)
  hunter_add_package(ios_sim)
endif()
# -- end

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

hunter_add_version(
    PACKAGE_NAME
    CppNetlib
    VERSION
    "0.10.1-hunter-2"
    URL
    "https://github.com/hunter-packages/cpp-netlib/archive/v0.10.1-hunter-2.tar.gz"
    SHA1
    2ad785004359bff887475f0df672f00eb3399df9
)

hunter_add_version(
    PACKAGE_NAME
    CppNetlib
    VERSION
    "0.10.1-hunter-3"
    URL
    "https://github.com/hunter-packages/cpp-netlib/archive/v0.10.1-hunter-3.tar.gz"
    SHA1
    b9e558264a4c2e24a59e037cfeb38509e2ce664c
)

hunter_pick_scheme(
    DEFAULT
    url_sha1_release_debug
    COMBINED
    url_sha1_combined_release_debug
)

hunter_download(PACKAGE_NAME CppNetlib)
