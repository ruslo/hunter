# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 2.8)
project(download_test)

include(../common.cmake)

set(
    HUNTER_PACKAGE_URL
    http://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_55_0.tar.bz2/download
)

set(
    HUNTER_PACKAGE_SHA1
    cef9a0cc7084b1d639e06cd3bc34e4251524c840
)

set(HUNTER_PACKAGE_COMPONENT system)

# Download boost
configure_file(
    ${HUNTER_ROOT}/cmake/schemes/url_sha1_boost.cmake.in
    ${DOWNLOAD_PROJECT_BASE}/CMakeLists.txt
    @ONLY
)

execute_test(${CMAKE_COMMAND} .)
execute_test(${CMAKE_COMMAND} --build .)

# Emulate polly/iOS (https://github.com/ruslo/polly)
execute_process(
    COMMAND
    xcode-select
    "-print-path"
    OUTPUT_VARIABLE
    XCODE_DEVELOPER_ROOT # /.../Xcode.app/Contents/Developer
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

set(IOS_SDK_VERSIONS 5.0 5.1 6.0 6.1 7.0)

foreach(x ${IOS_SDK_VERSIONS})
  execute_process(
      COMMAND
      xcodebuild
      -showsdks
      -sdk
      "iphoneos${x}"
      RESULT_VARIABLE
      IOS_SDK_VERSION_RESULT
      OUTPUT_QUIET
      ERROR_QUIET
  )
  if(${IOS_SDK_VERSION_RESULT} EQUAL 0)
    set(IOS_SDK_VERSION ${x})
  endif()
endforeach()

set(IOS_ARCHS armv7;armv7s)

set(HUNTER_PACKAGE_VARIANTS ios ios_sim ios_universal)

# Install library
configure_file(
    ${HUNTER_ROOT}/cmake/schemes/url_sha1_boost_ios_library.cmake.in
    ${DOWNLOAD_PROJECT_BASE}/CMakeLists.txt
    @ONLY
)

execute_test(${CMAKE_COMMAND} .)
execute_test(${CMAKE_COMMAND} --build .)

if(NOT EXISTS ${HUNTER_PACKAGE_INSTALL_DIR}/include/boost/config.hpp)
  hunter_fatal_error("Install failed")
endif()

if(NOT EXISTS ${HUNTER_PACKAGE_INSTALL_DIR}/lib)
  hunter_fatal_error("Install libs failed")
endif()
