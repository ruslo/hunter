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
