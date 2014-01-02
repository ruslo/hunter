# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_OPENSSL_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_OPENSSL_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)

hunter_add_version_start(OpenSSL)

hunter_add_version(
    PACKAGE_NAME
    OpenSSL
    VERSION
    "1.0.1e"
    URL
    "https://github.com/openssl/openssl/archive/OpenSSL_1_0_1e.tar.gz"
    SHA1
    4e8e2b21899f0dab567def50680dfd02a7acbb1a
)

hunter_add_version(
    PACKAGE_NAME
    OpenSSL
    VERSION
    "1.0.1d"
    URL
    "https://github.com/openssl/openssl/archive/OpenSSL_1_0_1d.tar.gz"
    SHA1
    d427eaf3e7e399f7f5562e00eebd6f2412903339
)

hunter_add_version(
    PACKAGE_NAME
    OpenSSL
    VERSION
    "1.0.0k"
    URL
    "https://github.com/openssl/openssl/archive/OpenSSL_1_0_0k.tar.gz"
    SHA1
    84c6ebb9f57af00c4eb7c34d40c97b5d61273037
)

hunter_add_version(
    PACKAGE_NAME
    OpenSSL
    VERSION
    "0.9.8y"
    URL
    "https://github.com/openssl/openssl/archive/OpenSSL_0_9_8y.tar.gz"
    SHA1
    b485a818490bd2818b7e948b26656c11fea77782
)

if(WIN32)
  set(_hunter_download_scheme url_sha_openssl_windows)
else()
  string(COMPARE EQUAL "${CMAKE_OSX_SYSROOT}" "iphoneos" _hunter_result)
  if(_hunter_result)
    set(_hunter_download_scheme url_sha1_openssl_ios)
  else()
    set(_hunter_download_scheme url_sha1_openssl)
  endif()
endif()

unset(_hunter_result)

hunter_download(
    PACKAGE_NAME
    OpenSSL
    DOWNLOAD_SCHEME
    ${_hunter_download_scheme}
)
unset(_hunter_download_scheme)
