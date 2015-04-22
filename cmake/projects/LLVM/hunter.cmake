# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_LLVM_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_LLVM_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_package(Clang) # CLANG_ROOT
hunter_add_package(ClangToolsExtra) # CLANGTOOLSEXTRA_ROOT
hunter_add_package(LLVMCompilerRT) # LLVMCOMPILERRT_ROOT

hunter_add_version(
    PACKAGE_NAME
    LLVM
    VERSION
    "3.5.0"
    URL
    "http://llvm.org/releases/3.5.0/llvm-3.5.0.src.tar.xz"
    SHA1
    58d817ac2ff573386941e7735d30702fe71267d5
)

hunter_add_version(
    PACKAGE_NAME
    LLVM
    VERSION
    "3.4.2"
    URL
    "http://llvm.org/releases/3.4.2/llvm-3.4.2.src.tar.gz"
    SHA1
    c5287384d0b95ecb0fd7f024be2cdfb60cd94bc9
)

hunter_cmake_args(
  LLVM
  CMAKE_ARGS
    "LLVM_EXTERNAL_CLANG_SOURCE_DIR=${CLANG_ROOT}"
    "LLVM_EXTERNAL_CLANG_TOOLS_EXTRA_SOURCE_DIR=${CLANGTOOLSEXTRA_ROOT}"
    "LLVM_EXTERNAL_COMPILER_RT_SOURCE_DIR=${LLVMCOMPILERRT_ROOT}"
    LLVM_INCLUDE_EXAMPLES=OFF
    LLVM_INCLUDE_TESTS=OFF
    LLVM_INCLUDE_DOCS=OFF
)

hunter_configuration_types(LLVM CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME LLVM)
