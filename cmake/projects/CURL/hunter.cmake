# Copyright (c) 2015, Steve Brain
# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

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

hunter_add_version(
    PACKAGE_NAME
    CURL
    VERSION
    "7.49.1-DEV-v5"
    URL
    "https://github.com/hunter-packages/curl/archive/hunter-7.49.1-v5.tar.gz"
    SHA1
    159d73e83f6cde54469c838234d32ed917ec9b80
)

hunter_add_version(
    PACKAGE_NAME
    CURL
    VERSION
    "7.49.1-DEV-v8"
    URL
    "https://github.com/hunter-packages/curl/archive/hunter-7.49.1-v8.tar.gz"
    SHA1
    3ac2684e3274c17ca209731e121e9a0acc79e4a5
)

hunter_add_version(
    PACKAGE_NAME
    CURL
    VERSION
    "7.49.1-DEV-v9"
    URL
    "https://github.com/hunter-packages/curl/archive/hunter-7.49.1-v9.tar.gz"
    SHA1
    4d4cb6e5faebfceaafa152bb3572c4760f1745cf
)

hunter_add_version(
    PACKAGE_NAME
    CURL
    VERSION
    "7.59.0-p0"
    URL
    "https://github.com/hunter-packages/curl/archive/v7.59.0-p0.tar.gz"
    SHA1
    55c76e06ec28c5641cd5c2f9d1b6666d25362c5b
)

hunter_add_version(
    PACKAGE_NAME
    CURL
    VERSION
    "7.59.0-p1"
    URL
    "https://github.com/hunter-packages/curl/archive/v7.59.0-p1.tar.gz"
    SHA1
    7d8190ad978591d621db1066b96f90722d68a00d
)

hunter_add_version(
    PACKAGE_NAME
    CURL
    VERSION
    "7.60.0-p0"
    URL
    "https://github.com/hunter-packages/curl/archive/v7.60.0-p0.tar.gz"
    SHA1
    53b5065094322323ed38840012eee42c5d4d1640
)

hunter_add_version(
    PACKAGE_NAME
    CURL
    VERSION
    "7.60.0-p2"
    URL
    "https://github.com/hunter-packages/curl/archive/v7.60.0-p2.tar.gz"
    SHA1
    c15efe3c6c77c5f5d5b098b73d31cc3fbbc0d2fc
)

if (ANDROID OR IOS OR RASPBERRY_PI OR OPENWRT)
  set(_curl_cmake_args
      HAVE_FSETXATTR_5=0
      HAVE_FSETXATTR_5__TRYRUN_OUTPUT=""
      HAVE_FSETXATTR_6=0
      HAVE_FSETXATTR_6__TRYRUN_OUTPUT=""
      HAVE_GLIBC_STRERROR_R=1
      HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT=""
      HAVE_POLL_FINE_EXITCODE=0
      HAVE_POLL_FINE_EXITCODE__TRYRUN_OUTPUT=""
      HAVE_POSIX_STRERROR_R=0
      HAVE_POSIX_STRERROR_R__TRYRUN_OUTPUT=""
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
        BUILD_TESTING=OFF
        ${_curl_cmake_args}
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(CURL)
hunter_download(PACKAGE_NAME CURL)
