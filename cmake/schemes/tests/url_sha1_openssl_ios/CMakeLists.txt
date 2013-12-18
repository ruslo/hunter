# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 2.8)
project(download_test)

include(../common.cmake)

set(
    HUNTER_PACKAGE_URL
    "https://github.com/openssl/openssl/archive/OpenSSL_1_0_1e.tar.gz"
)

set(HUNTER_PACKAGE_SHA1 4e8e2b21899f0dab567def50680dfd02a7acbb1a)

set(
    HUNTER_PACKAGE_VARIANTS
    ${IPHONEOS_ARCHS}
    ${IPHONESIMULATOR_ARCHS}
    ios_universal
)

# Install library
configure_file(
    ${HUNTER_ROOT}/cmake/schemes/url_sha1_openssl_ios.cmake.in
    ${DOWNLOAD_PROJECT_BASE}/CMakeLists.txt
    @ONLY
)

execute_test(${CMAKE_COMMAND} .)
execute_test(${CMAKE_COMMAND} --build .)

if(NOT EXISTS ${HUNTER_PACKAGE_INSTALL_DIR}/include/openssl/crypto.h)
  hunter_fatal_error("Install failed")
endif()
