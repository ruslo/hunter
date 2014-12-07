# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_LLVMCOMPILERRT_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_LLVMCOMPILERRT_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version_start(LLVMCompilerRT)

hunter_add_version(
    PACKAGE_NAME
    LLVMCompilerRT
    VERSION
    "3.5.0"
    URL
    "http://llvm.org/releases/3.5.0/compiler-rt-3.5.0.src.tar.xz"
    SHA1
    61f3e78088ce4a0787835036f2d3c61ede11e928
)

hunter_add_version(
    PACKAGE_NAME
    LLVMCompilerRT
    VERSION
    "3.4.2"
    URL
    "http://llvm.org/releases/3.4/compiler-rt-3.4.src.tar.gz"
    SHA1
    d644b1e4f306f7ad35df0a134d14a1123cd9f082
)

hunter_pick_scheme(DEFAULT url_sha1_no_install)

hunter_download(PACKAGE_NAME LLVMCompilerRT)
