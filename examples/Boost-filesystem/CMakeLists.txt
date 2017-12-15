# Copyright (c) 2013-2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)

# download boost
hunter_add_package(Boost COMPONENTS system filesystem)

# now boost can be used
find_package(Boost CONFIG REQUIRED system filesystem)

if(ANDROID)
  string(COMPARE EQUAL "${CMAKE_ANDROID_NDK}" "" is_empty)
  if(is_empty)
    message(FATAL_ERROR "CMAKE_ANDROID_NDK is empty")
  endif()
  add_library(
      foo
      SHARED
      foo_android.cpp
      "${CMAKE_ANDROID_NDK}/sources/android/native_app_glue/android_native_app_glue.c"
  )
else()
  add_executable(foo foo.cpp)
endif()

target_link_libraries(foo Boost::system Boost::filesystem)

if(ANDROID)
  target_link_libraries(foo log android)
  target_include_directories(
      foo PUBLIC "${CMAKE_ANDROID_NDK}/sources/android/native_app_glue"
  )

  if(NOT "$ENV{TRAVIS}")
    # Travis CI failed builds:
    # * https://travis-ci.org/ingenue/hunter/jobs/106905844
    # * https://travis-ci.org/ingenue/hunter/jobs/106905851
    hunter_add_package(Android-Apk)
    list(APPEND CMAKE_MODULE_PATH "${ANDROID-APK_ROOT}")
    include(AndroidApk)

    hunter_add_package(Android-SDK)
    message("Path to `android`: ${ANDROID-SDK_ROOT}/android-sdk/tools/android")
    message("Path to `emulator`: ${ANDROID-SDK_ROOT}/android-sdk/tools/emulator")
    message("Path to `adb`: ${ANDROID-SDK_ROOT}/android-sdk/platform-tools/adb")

    android_create_apk(
        BASE_TARGET foo
        LAUNCH_TARGET foo-launch
        DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/apk"
    )
  endif()
endif()
