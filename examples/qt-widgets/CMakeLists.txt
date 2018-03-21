# Simple Qt Widgets project created by QtCreator
# CmakeLists.txt from http://doc.qt.io/qt-5/cmake-manual.html

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(qt-widgets)

hunter_add_package(Qt)

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# Instruct CMake to run moc automatically when needed.
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)

# Find the QtWidgets library
find_package(Qt5Widgets REQUIRED)

if(APPLE)
  # Travis error:
  # * https://travis-ci.org/ingenue/hunter/jobs/354713684
  # * You can't use this version of (null) with this version of macOS. You have macOS 10.12.6. Qt requires macOS 10.13.0 or later.
  if(NOT TARGET Qt5::Widgets)
    message(FATAL_ERROR "No Qt5::Widgets target")
  endif()
  return()
endif()

# Tell CMake to create the helloworld executable
add_executable(
    helloworld
    WIN32
    main.cpp
    MainWindow.cpp
    MainWindow.ui
)

# Use the Widgets module from Qt 5.
target_link_libraries(helloworld Qt5::Widgets)

if(APPLE)
  # Have to link it manually because of cyclic dependencies in Qt
  find_package(Qt5PrintSupport REQUIRED)
  target_link_libraries(helloworld Qt5::PrintSupport)
endif()
