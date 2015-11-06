# Copyright (c) 2015, Ruslan Baratov, David Hirvonen
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(qt-camera)

hunter_add_package(Qt COMPONENTS qtmultimedia) # Qt5MultimediaWidgets

find_package(Qt5MultimediaWidgets REQUIRED) # Qt5::MultimediaWidgets
find_package(Qt5OpenGL REQUIRED) # Qt5::OpenGL

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(
    SOURCES
    camera.cpp
    camera.h
    camera.ui
    imagesettings.cpp
    imagesettings.h
    imagesettings.ui
    main.cpp
    videosettings.cpp
    videosettings.h
    videosettings.ui
)

if(ANDROID)
  add_library(qt-camera SHARED ${SOURCES})
  set_target_properties(qt-camera PROPERTIES VERSION 1.0)

  hunter_add_package(QtAndroidCMake)
  list(APPEND CMAKE_MODULE_PATH "${QTANDROIDCMAKE_ROOT}")
  include(AddQtAndroidApk)

  add_qt_android_apk(
      TARGET qt-camera-apk
      BASE_TARGET qt-camera
      LAUNCH_TARGET qt-camera-launch
      PACKAGE_NAME camera.qt # must be no '-' (API 16 error)
      MANIFEST "${CMAKE_CURRENT_LIST_DIR}/AndroidManifest.xml.in"
  )

  hunter_add_package(Android-SDK)
  message("Path to `android`: ${ANDROID-SDK_ROOT}/android-sdk/tools/android")
  message("Path to `emulator`: ${ANDROID-SDK_ROOT}/android-sdk/tools/emulator")
  message("Path to `adb`: ${ANDROID-SDK_ROOT}/android-sdk/platform-tools/adb")

else()
  add_executable(qt-camera ${SOURCES})
endif()

if(APPLE)
  set(plugins Qt5::AVFMediaPlayerServicePlugin Qt5::AVFServicePlugin)
elseif(ANDROID)
  set(plugins "")
elseif(UNIX)
  set(plugins "")
elseif(WIN32)
  set(plugins Qt5::DSServicePlugin)
else()
  message(FATAL_ERROR "Not supported")
endif()

target_link_libraries(
  qt-camera
  PUBLIC
  Qt5::MultimediaWidgets
  Qt5::OpenGL
  ${plugins}
)

# Workaround for Linux's linker problems (*_MULTIPLICITY doesn't help, TODO) --
if(UNIX AND NOT APPLE AND CMAKE_COMPILER_IS_GNUCXX)
  string(
      REPLACE
      "<LINK_LIBRARIES>"
      " -Wl,--start-group <LINK_LIBRARIES> -Wl,--end-group "
      CMAKE_CXX_LINK_EXECUTABLE
      "${CMAKE_CXX_LINK_EXECUTABLE}"
  )
endif()
# --
