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
    sentencepiece
    VERSION
    0.1.8-p1
    URL
    "https://github.com/hunter-packages/sentencepiece/archive/v0.1.8-p1.tar.gz"
    SHA1
    00e5a16ce6af6a4148cd9541c7ff26b9d5e58972
)

set(_hunter_spm_cmake_args "")
if(IOS)
  list(
      APPEND
      _hunter_spm_cmake_args
      SPM_NO_THREADLOCAL=YES
  )
endif()

list(
    APPEND
    _hunter_spm_cmake_args
    SPM_USE_BUILTIN_PROTOBUF=OFF
    SPM_ENABLE_SHARED=OFF
)

hunter_cmake_args(
    sentencepiece
    CMAKE_ARGS
    ${_hunter_spm_cmake_args}
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(sentencepiece)
hunter_download(PACKAGE_NAME sentencepiece)
