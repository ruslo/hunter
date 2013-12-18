# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 2.8.8)

set(HUNTER_ROOT "${CMAKE_CURRENT_LIST_DIR}/../../..")
include(${HUNTER_ROOT}/cmake/Hunter)

include(${CMAKE_CURRENT_LIST_DIR}/utilities.cmake)

# rewrite base for testing
set(HUNTER_BASE ${PROJECT_BINARY_DIR}/_hunter_base)

# temp project location
set(DOWNLOAD_PROJECT_BASE ${PROJECT_BINARY_DIR}/_download)

# describe test download project (URL and SHA1 defined in test CMakeLists.txt)
set(HUNTER_PACKAGE_NAME dotest)
set(HUNTER_PACKAGE_BASENAME dotest)
set(HUNTER_INSTALL_TAG test_default)

# set EP_BASE directory
set(HUNTER_PACKAGE_INSTALL_DIR ${HUNTER_BASE}/Install)
set(HUNTER_PACKAGE_DOWNLOAD_DIR ${HUNTER_BASE}/Download/${HUNTER_PACKAGE_NAME})
set(HUNTER_PACKAGE_SOURCE_DIR ${HUNTER_BASE}/Source/${HUNTER_PACKAGE_NAME})

# more verbose
set(HUNTER_STATUS_DEBUG ON)

if(APPLE)
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

  set(IPHONEOS_ARCHS armv7;armv7s;arm64)
  set(IPHONESIMULATOR_ARCHS x86_64;i386)

  set(
      IPHONESIMULATOR_ROOT
      "${XCODE_DEVELOPER_ROOT}/Platforms/iPhoneSimulator.platform/Developer"
  )
  set(
      IPHONESIMULATOR_SDK_ROOT
      "${IPHONESIMULATOR_ROOT}/SDKs/iPhoneSimulator${IOS_SDK_VERSION}.sdk"
  )
  set(
      IPHONEOS_ROOT
      "${XCODE_DEVELOPER_ROOT}/Platforms/iPhoneOS.platform/Developer"
  )
  set(IPHONEOS_SDK_ROOT "${IPHONEOS_ROOT}/SDKs/iPhoneOS${IOS_SDK_VERSION}.sdk")
endif()
