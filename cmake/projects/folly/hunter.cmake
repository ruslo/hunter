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
    folly
    VERSION
    2017.11.13.00-p0
    URL
    "https://github.com/hunter-packages/folly/archive/v2017.11.13.00-p0.tar.gz"
    SHA1
    cb7592adcda706df5f558466b96b1ab4c6bc751a
)

hunter_add_version(
    PACKAGE_NAME
    folly
    VERSION
    2018.10.22.00-p2
    URL
    "https://github.com/hunter-packages/folly/archive/v2018.10.22.00-p2.tar.gz"
    SHA1
    5cd5d03bbddd3ad047afc0e402bd3ee3af2888f4
)

hunter_add_version(
    PACKAGE_NAME
    folly
    VERSION
    2018.10.22.00-p3
    URL
    "https://github.com/hunter-packages/folly/archive/v2018.10.22.00-p3.tar.gz"
    SHA1
    74487a7393a9cac9c8b49581b3fe965c129d28f3
)

hunter_add_version(
    PACKAGE_NAME
    folly
    VERSION
    2018.10.22.00-p4
    URL
    "https://github.com/hunter-packages/folly/archive/v2018.10.22.00-p4.tar.gz"
    SHA1
    aeb254f1010cff1857e5fff897ebbc20e710b410
)

set(__hunter_folly_args FOLLY_POD_CONFIGURATION=ON)

if("${CMAKE_SYSTEM_NAME}" STREQUAL "WindowsStore")
  set(__hunter_folly_windows_store TRUE)
else()
  set(__hunter_folly_windows_store FALSE)
endif()

if(__hunter_folly_windows_store)
  list(APPEND __hunter_folly_args FOLLY_USE_GLOG=OFF)
endif()

if(IOS OR ANDROID OR __hunter_folly_windows_store)
  # Fix 'try_run'
  list(
      APPEND
      __hunter_folly_args
      FOLLY_HAVE_UNALIGNED_ACCESS_EXITCODE=""
      FOLLY_HAVE_UNALIGNED_ACCESS_EXITCODE__TRYRUN_OUTPUT=""
      FOLLY_HAVE_LINUX_VDSO_EXITCODE=""
      FOLLY_HAVE_LINUX_VDSO_EXITCODE__TRYRUN_OUTPUT=""
      FOLLY_HAVE_WCHAR_SUPPORT_EXITCODE=""
      FOLLY_HAVE_WCHAR_SUPPORT_EXITCODE__TRYRUN_OUTPUT=""
      HAVE_VSNPRINTF_ERRORS_EXITCODE=""
      HAVE_VSNPRINTF_ERRORS_EXITCODE__TRYRUN_OUTPUT=""
      FOLLY_HAVE_XSI_STRERROR_R_EXITCODE=""
      FOLLY_HAVE_XSI_STRERROR_R_EXITCODE__TRYRUN_OUTPUT=""
  )
endif()

hunter_cmake_args(folly CMAKE_ARGS ${__hunter_folly_args})

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(folly)
hunter_download(PACKAGE_NAME folly)
