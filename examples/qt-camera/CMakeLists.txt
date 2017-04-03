# Copyright (c) 2015, Ruslan Baratov, David Hirvonen
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(qt-camera)

hunter_add_package(Qt COMPONENTS qtmultimedia) # Qt5MultimediaWidgets

find_package(Qt5MultimediaWidgets REQUIRED) # Qt5::MultimediaWidgets
find_package(Qt5PrintSupport REQUIRED) # Qt5::PrintSupport

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
  # Doesn't work in fact, working example is here:
  # * https://github.com/forexample/android-cmake/tree/master/08-declarative-camera
  add_library(qt-camera SHARED ${SOURCES})
  set_target_properties(qt-camera PROPERTIES VERSION 1.0)

  hunter_add_package(QtAndroidCMake)
  list(APPEND CMAKE_MODULE_PATH "${QTANDROIDCMAKE_ROOT}")
  include(AddQtAndroidApk)

  if(NOT "$ENV{TRAVIS}")
    # Can't install dependencies to work with Android stuff:
    # * https://github.com/travis-ci/travis-ci/issues/7558
    # * https://github.com/ruslo/hunter/issues/718
    add_qt_android_apk(
        TARGET qt-camera-apk
        BASE_TARGET qt-camera
        LAUNCH_TARGET qt-camera-launch
        PACKAGE_NAME camera.qt # must be no '-' (API 16 error)
        MANIFEST "${CMAKE_CURRENT_LIST_DIR}/AndroidManifest.xml.in"
    )
  endif()

  hunter_add_package(Android-SDK)
  message("Path to `android`: ${ANDROID-SDK_ROOT}/android-sdk/tools/android")
  message("Path to `emulator`: ${ANDROID-SDK_ROOT}/android-sdk/tools/emulator")
  message("Path to `adb`: ${ANDROID-SDK_ROOT}/android-sdk/platform-tools/adb")

else()
  add_executable(qt-camera ${SOURCES})
endif()

if(IOS)
  find_package(Qt5OpenGL REQUIRED)
  set(plugins Qt5::OpenGL)
elseif(APPLE)
  find_package(Qt5OpenGL REQUIRED)
  set(plugins Qt5::AVFMediaPlayerServicePlugin Qt5::AVFServicePlugin Qt5::OpenGL)
elseif(ANDROID)
  set(plugins "")
elseif(UNIX) # Linux
  find_package(Qt5OpenGL REQUIRED)
  set(plugins Qt5::OpenGL)
elseif(WIN32)
  find_package(Qt5OpenGL REQUIRED)
  set(plugins Qt5::DSServicePlugin Qt5::OpenGL)
  if(MINGW)
    list(APPEND plugins strmiids)

    # defined: '_imp__glDepthRange'
    list(APPEND plugins opengl32)

    # defined `hb_ot_tags_from_script'
    # should be set before Qt5::Gui
    list(APPEND plugins "${QT_ROOT}/lib/libqtharfbuzzng.a")

    # defined: 'pcre16_exec'
    list(APPEND plugins "${QT_ROOT}/lib/libqtpcre.a")

    # defined: '_WSAAsyncSelect'
    list(APPEND plugins ws2_32)
  endif()
else()
  message(FATAL_ERROR "Not supported")
endif()

target_link_libraries(
  qt-camera
  PUBLIC
  Qt5::MultimediaWidgets
  Qt5::PrintSupport
  ${plugins}
)

set(fix_cyclic FALSE)
if(APPLE)
  set(fix_cyclic FALSE)
elseif(CMAKE_COMPILER_IS_GNUCXX)
  # MinGW included
  set(fix_cyclic TRUE)
elseif(NOT UNIX)
  set(fix_cyclic FALSE)
elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  # Linux Clang
  set(fix_cyclic TRUE)
endif()

# Workaround for Linux's linker problems (*_MULTIPLICITY doesn't help, TODO) --
if(fix_cyclic)
  string(
      REPLACE
      "<LINK_LIBRARIES>"
      " -Wl,--start-group <LINK_LIBRARIES> -Wl,--end-group "
      CMAKE_CXX_LINK_EXECUTABLE
      "${CMAKE_CXX_LINK_EXECUTABLE}"
  )
endif()
# --
