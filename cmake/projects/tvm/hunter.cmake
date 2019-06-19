# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    tvm
    VERSION
    0.4-0f053c8-p0
    URL
    "https://github.com/hunter-packages/tvm/archive/v0.4-0f053c8-p0.tar.gz"
    SHA1
    1c28b3246e3f5ecb6f985899a5b078a1cb81f85b
)

hunter_add_version(
    PACKAGE_NAME
    tvm
    VERSION
    0.4-0f053c8-p3
    URL
    "https://github.com/hunter-packages/tvm/archive/v0.4-0f053c8-p3.tar.gz"
    SHA1
    7c721091b437ccbe20c706f194b68dbff3acd712
)

hunter_add_version(
    PACKAGE_NAME
    tvm
    VERSION
    0.4-0f053c8-p4
    URL
    "https://github.com/hunter-packages/tvm/archive/v0.4-0f053c8-p4.tar.gz"
    SHA1
    3cdbec21b8766f7f51abc78d957fe398c70470a5
)

hunter_add_version(
    PACKAGE_NAME
    tvm
    VERSION
    0.5-p2
    URL
    "https://github.com/hunter-packages/tvm/archive/v0.5-p2.tar.gz"
    SHA1
    f050a50ade4e1508621d5138b6edf8b09d9bbcc5
)

hunter_add_version(
    PACKAGE_NAME
    tvm
    VERSION
    0.5-p3
    URL
    "https://github.com/hunter-packages/tvm/archive/v0.5-p3.tar.gz"
    SHA1
    ddc16b4125b7eafbe34b63da50e7622fe961787e
)

hunter_add_version(
    PACKAGE_NAME
    tvm
    VERSION
    0.5-p4
    URL
    "https://github.com/hunter-packages/tvm/archive/v0.5-p4.tar.gz"
    SHA1
    f62ace1e9515799de83b29c6325588e48fc76479
)

hunter_add_version(
    PACKAGE_NAME
    tvm
    VERSION
    0.5-p5
    URL
    "https://github.com/hunter-packages/tvm/archive/v0.5-p5.tar.gz"
    SHA1
    bd53c022d5c39f93ad696828479f463cf39706ba
)

hunter_add_version(
    PACKAGE_NAME
    tvm
    VERSION
    0.5-a4bc50e-p0
    URL
    "https://github.com/hunter-packages/tvm/archive/v0.5-a4bc50e-p0.tar.gz"
    SHA1
    0ccc5ef771fcddf8e3ce4534f60917a3c8838fb2
)

set(
    __hunter_tvm_cmake_args
    INSTALL_DEV=ON
    INSTALL_NNVM_SOURCES=ON
)

if(IOS OR ANDROID OR WIN32)
  list(APPEND __hunter_tvm_cmake_args TVM_BUILD_RUNTIME_ONLY=ON)
else()
  list(APPEND __hunter_tvm_cmake_args USE_GRAPH_RUNTIME_DEBUG=ON USE_LLVM=ON)

  if("${CMAKE_SYSTEM_NAME}" STREQUAL "Linux")
    list(APPEND __hunter_tvm_cmake_args USE_CUDA=ON)
  endif()

  if(APPLE)
    list(APPEND __hunter_tvm_cmake_args USE_METAL=ON)
  endif()
endif()

hunter_cmake_args(tvm CMAKE_ARGS ${__hunter_tvm_cmake_args})

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(tvm)
hunter_download(PACKAGE_NAME tvm)
