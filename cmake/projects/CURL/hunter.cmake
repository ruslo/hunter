# Copyright (c) 2015, Steve Brain
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules



include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

# List of versions here...

hunter_add_version(
    PACKAGE_NAME
    CURL
    VERSION
    "7.49.1-DEV-v4"
    URL
    "https://github.com/hunter-packages/curl/archive/hunter-7.49.1-v4.tar.gz"
    SHA1
    1b17954403db625d5422faf8c7fd68b5dde093f9
)


if (ANDROID OR IOS)
  set(_curl_cmake_args
      HAVE_GLIBC_STRERROR_R=1
      HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT=""
      HAVE_POSIX_STRERROR_R=0
      HAVE_POSIX_STRERROR_R__TRYRUN_OUTPUT=""
      HAVE_POLL_FINE_EXITCODE=0
  )
else()
  set(_curl_cmake_args "")
endif()

hunter_cmake_args(
    CURL
    CMAKE_ARGS
        BUILD_CURL_TESTS=OFF
        BUILD_CURL_EXE=OFF
        CMAKE_USE_OPENSSL=ON
        CMAKE_USE_LIBSSH2=OFF
        ${_curl_cmake_args}
)



# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(CURL)
hunter_download(PACKAGE_NAME CURL)
