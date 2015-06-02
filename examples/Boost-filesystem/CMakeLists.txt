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
  add_library(
      foo
      SHARED
      foo_android.cpp
      "${ANDROID_NDK}/sources/android/native_app_glue/android_native_app_glue.c"
  )
else()
  add_executable(foo foo.cpp)
endif()

target_link_libraries(foo Boost::system Boost::filesystem)

# Compatibility mode
set(Boost_USE_STATIC_LIBS ON)
if(MSVC)
  add_definitions(-DBOOST_ALL_NO_LIB=1)
endif()
find_package(Boost REQUIRED system filesystem)
include_directories("${Boost_INCLUDE_DIRS}")
target_link_libraries(foo ${Boost_LIBRARIES})

if(ANDROID)
  hunter_add_package(Android-Apk)
  list(APPEND CMAKE_MODULE_PATH "${ANDROID-APK_ROOT}")
  include(AndroidApk)

  hunter_add_package(Android-SDK)
  message("Path to `android`: ${ANDROID-SDK_ROOT}/android-sdk/tools/android")
  message("Path to `emulator`: ${ANDROID-SDK_ROOT}/android-sdk/tools/emulator")
  message("Path to `adb`: ${ANDROID-SDK_ROOT}/android-sdk/platform-tools/adb")

  target_link_libraries(foo log android)
  target_include_directories(
      foo PUBLIC "${ANDROID_NDK}/sources/android/native_app_glue"
  )

  android_create_apk(NAME foo DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/apk")
endif()
