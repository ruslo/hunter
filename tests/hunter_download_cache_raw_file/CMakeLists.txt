# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")
project(TestModuleHunterDownloadCacheRawFile)

include(hunter_download_cache_raw_file)

set(HUNTER_CACHE_SERVERS "https://github.com/ingenue/hunter-cache")
set(HUNTER_CACHED_ROOT "${CMAKE_CURRENT_BINARY_DIR}/_HUNTER")

set(fromserver "${HUNTER_CACHED_ROOT}/from.server")
set(local_good "${HUNTER_CACHED_ROOT}/_Base/Cache/raw/0940da93922ec0790836ebaccf2ccf14baf65df4.tar.bz2")
set(sha1_good "0940da93922ec0790836ebaccf2ccf14baf65df4")

set(local_not_exists "${HUNTER_CACHED_ROOT}/_Base/Cache/raw/0940da93922ec0790836ebaccf2ccf14baf65xxx.tar.bz2")

### Successfull download
hunter_download_cache_raw_file(LOCAL "${local_good}" SHA1 "${sha1_good}" FROMSERVER "${fromserver}")

if(NOT EXISTS "${local_good}")
  message(FATAL_ERROR "File not downloaded")
endif()

### File not found

hunter_download_cache_raw_file(LOCAL "${local_not_exists}" SHA1 "${sha1_good}" FROMSERVER "${fromserver}")

if(EXISTS "${local_not_exists}")
  message(FATAL_ERROR "File should be removed")
endif()

### File already downloaded, ok even server is bad

set(HUNTER_CACHE_SERVERS "https://github.com/ingenue/bad-hunter-cache")

hunter_download_cache_raw_file(LOCAL "${local_good}" SHA1 "${sha1_good}" FROMSERVER "${fromserver}")

if(NOT EXISTS "${local_good}")
  message(FATAL_ERROR "File not downloaded")
endif()

### Server is bad

file(REMOVE "${local_good}")

set(HUNTER_CACHE_SERVERS "https://github.com/ingenue/bad-hunter-cache")

hunter_download_cache_raw_file(LOCAL "${local_good}" SHA1 "${sha1_good}" FROMSERVER "${fromserver}")

if(EXISTS "${local_good}")
  message(FATAL_ERROR "File should be removed")
endif()
