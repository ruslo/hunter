# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

# emulate polly/iOS (https://github.com/ruslo/polly)

if(DEFINED EXAMPLE_TOOLCHAIN_CMAKE)
  return()
else()
  set(EXAMPLE_TOOLCHAIN_CMAKE 1)
endif()

execute_process(
    COMMAND
    xcode-select
    "-print-path"
    OUTPUT_VARIABLE
    XCODE_DEVELOPER_ROOT # /.../Xcode.app/Contents/Developer
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

set(CMAKE_OSX_SYSROOT "iphoneos" CACHE STRING "System root for iOS" FORCE)

set(CMAKE_CXX_COMPILER_WORKS TRUE CACHE BOOL "Skip compiler check" FORCE)
set(CMAKE_C_COMPILER_WORKS TRUE CACHE BOOL "Skip compiler check" FORCE)

set(IPHONEOS_ARCHS armv7;armv7s;arm64)
set(IPHONESIMULATOR_ARCHS x86_64;i386)

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

if(NOT IOS_SDK_VERSION)
  message(FATAL_ERROR "iOS version not found, tested: [${IOS_SDK_VERSIONS}]")
endif()

# iPhone simulator root
set(
    IPHONESIMULATOR_ROOT
    "${XCODE_DEVELOPER_ROOT}/Platforms/iPhoneSimulator.platform/Developer"
)
if(NOT EXISTS "${IPHONESIMULATOR_ROOT}")
  polly_fatal_error(
      "IPHONESIMULATOR_ROOT not found (${IPHONESIMULATOR_ROOT})\n"
      "XCODE_DEVELOPER_ROOT: ${XCODE_DEVELOPER_ROOT}\n"
  )
endif()

# iPhone simulator SDK root
set(
    IPHONESIMULATOR_SDK_ROOT
    "${IPHONESIMULATOR_ROOT}/SDKs/iPhoneSimulator${IOS_SDK_VERSION}.sdk"
)

if(NOT EXISTS ${IPHONESIMULATOR_SDK_ROOT})
  polly_fatal_error(
      "IPHONESIMULATOR_SDK_ROOT not found (${IPHONESIMULATOR_SDK_ROOT})\n"
      "IPHONESIMULATOR_ROOT: ${IPHONESIMULATOR_ROOT}\n"
      "IOS_SDK_VERSION: ${IOS_SDK_VERSION}\n"
  )
endif()

# iPhone root
set(
    IPHONEOS_ROOT
    "${XCODE_DEVELOPER_ROOT}/Platforms/iPhoneOS.platform/Developer"
)
if(NOT EXISTS "${IPHONEOS_ROOT}")
  polly_fatal_error(
      "IPHONEOS_ROOT not found (${IPHONEOS_ROOT})\n"
      "XCODE_DEVELOPER_ROOT: ${XCODE_DEVELOPER_ROOT}\n"
  )
endif()

# iPhone SDK root
set(IPHONEOS_SDK_ROOT "${IPHONEOS_ROOT}/SDKs/iPhoneOS${IOS_SDK_VERSION}.sdk")

if(NOT EXISTS ${IPHONEOS_SDK_ROOT})
  hunter_fatal_error(
      "IPHONEOS_SDK_ROOT not found (${IPHONEOS_SDK_ROOT})\n"
      "IPHONEOS_ROOT: ${IPHONEOS_ROOT}\n"
      "IOS_SDK_VERSION: ${IOS_SDK_VERSION}\n"
  )
endif()

set(HUNTER_CMAKE_GENERATOR Xcode)

