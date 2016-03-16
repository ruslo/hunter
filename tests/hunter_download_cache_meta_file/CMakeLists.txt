# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")
project(TestModuleHunterDownloadCacheMetaFile)

include(hunter_download_cache_meta_file)

set(HUNTER_CACHE_SERVERS "https://github.com/ingenue/hunter-cache")
set(HUNTER_CACHED_ROOT "${CMAKE_CURRENT_BINARY_DIR}/_HUNTER")

set(local_done_good "${HUNTER_CACHED_ROOT}/_Base/Cache/meta/db260dd/GTest/1.8.0-hunter-p2/93148cb/da39a3e/a49b0e5/356a192/da39a3e/CACHE.DONE")
set(local_sha1_good "${HUNTER_CACHED_ROOT}/_Base/Cache/meta/db260dd/GTest/1.8.0-hunter-p2/93148cb/da39a3e/a49b0e5/356a192/da39a3e/cache.sha1")

set(local_done_not_exists "${HUNTER_CACHED_ROOT}/_Base/Cache/meta/db260dd/GTest/1.8.0-hunter-p2/93148cb/da39a3e/a49b0e5/356a192/xxxxxxx/CACHE.DONE")
set(local_sha1_not_exists "${HUNTER_CACHED_ROOT}/_Base/Cache/meta/db260dd/GTest/1.8.0-hunter-p2/93148cb/da39a3e/a49b0e5/356a192/xxxxxxx/cache.sha1")

### Successfull download
hunter_download_cache_meta_file(LOCAL "${local_sha1_good}" DONE "${local_done_good}")

if(NOT EXISTS "${local_sha1_good}")
  message(FATAL_ERROR "File not downloaded")
endif()

if(NOT EXISTS "${local_done_good}")
  message(FATAL_ERROR "File not downloaded")
endif()

### File not found

hunter_download_cache_meta_file(LOCAL "${local_sha1_not_exists}" DONE "${local_done_not_exists}")

if(EXISTS "${local_sha1_not_exists}")
  message(FATAL_ERROR "File should be removed")
endif()

if(EXISTS "${local_done_not_exists}")
  message(FATAL_ERROR "File should be removed")
endif()

### File already downloaded, ok even server is bad

set(HUNTER_CACHE_SERVERS "https://github.com/ingenue/bad-hunter-cache")

hunter_download_cache_meta_file(LOCAL "${local_sha1_good}" DONE "${local_done_good}")

if(NOT EXISTS "${local_sha1_good}")
  message(FATAL_ERROR "File not downloaded")
endif()

if(NOT EXISTS "${local_done_good}")
  message(FATAL_ERROR "File not downloaded")
endif()

### Server is bad

file(REMOVE "${local_done_good}")
file(REMOVE "${local_sha1_good}")

set(HUNTER_CACHE_SERVERS "https://github.com/ingenue/bad-hunter-cache")

hunter_download_cache_meta_file(LOCAL "${local_sha1_good}" DONE "${local_done_good}")

if(EXISTS "${local_sha1_good}")
  message(FATAL_ERROR "File should be removed")
endif()

if(EXISTS "${local_done_good}")
  message(FATAL_ERROR "File should be removed")
endif()
