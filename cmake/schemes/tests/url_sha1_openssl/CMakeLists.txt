# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 2.8.12)
project(download_test)

include(../common.cmake)

set(
    HUNTER_PACKAGE_URL
    "https://github.com/openssl/openssl/archive/OpenSSL_1_0_1e.tar.gz"
)
set(HUNTER_PACKAGE_SHA1 4e8e2b21899f0dab567def50680dfd02a7acbb1a)

configure_file(
    "${HUNTER_SELF}/cmake/schemes/url_sha1_openssl.cmake.in"
    "${DOWNLOAD_PROJECT_BASE}/CMakeLists.txt"
    @ONLY
)

set(toolchain "${DOWNLOAD_PROJECT_BASE}/toolchain.cmake")

execute_process(
    COMMAND
    "${CMAKE_COMMAND}" -E touch "${toolchain}"
)

execute_test("${CMAKE_COMMAND}" "-DCMAKE_TOOLCHAIN_FILE=${toolchain}" .)
execute_test("${CMAKE_COMMAND}" --build .)

if(NOT EXISTS "${HUNTER_PACKAGE_INSTALL_DIR}/include/openssl/crypto.h")
  hunter_fatal_error("Install failed")
endif()
