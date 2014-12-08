# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_LIBCXXABI_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_LIBCXXABI_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version_start(Libcxxabi)

hunter_add_version(
    PACKAGE_NAME
    Libcxxabi
    VERSION
    "3.5.0"
    URL
    "http://llvm.org/releases/3.5.0/libcxxabi-3.5.0.src.tar.xz"
    SHA1
    31ffde04899449ae754a39c3b4e331a73a51a831
)

# http://libcxxabi.llvm.org/
hunter_cmake_args(
    Libcxxabi
    CMAKE_ARGS
        LIBCXXABI_ENABLE_ASSERTIONS=OFF
        LIBCXXABI_ENABLE_SHARED=OFF
)

hunter_pick_scheme(
    DEFAULT url_sha1_release_debug
    COMBINED url_sha1_combined_release_debug
)

hunter_download(PACKAGE_NAME Libcxxabi)
