# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-glog)

hunter_add_package(glog)

find_package(glog CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo glog::glog)

if(NOT EXISTS "${glog_LICENSES}") # one file expected
  message(FATAL_ERROR "File not found: '${glog_LICENSES}'")
endif()

message("License: '${glog_LICENSES}'")

if(ANDROID)
  hunter_add_package(Android-Apk)
  list(APPEND CMAKE_MODULE_PATH "${ANDROID-APK_ROOT}")

  include(AndroidApk) # android_add_test

  enable_testing()
  android_add_test(NAME FooTest COMMAND foo)

  hunter_add_package(Android-SDK)
  message("Path to `android`: ${ANDROID-SDK_ROOT}/android-sdk/tools/android")
  message("Path to `emulator`: ${ANDROID-SDK_ROOT}/android-sdk/tools/emulator")
  message("Path to `adb`: ${ANDROID-SDK_ROOT}/android-sdk/platform-tools/adb")
endif()
