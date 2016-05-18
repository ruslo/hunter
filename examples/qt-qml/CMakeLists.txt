cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(qt-qml)

hunter_add_package(Qt COMPONENTS qtdeclarative)

find_package(Qt5Widgets REQUIRED)
find_package(Qt5Quick REQUIRED)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

if(APPLE)
  # Have to link it manually because of cyclic dependencies in Qt
  find_package(Qt5PrintSupport REQUIRED)
  set(plugins Qt5::PrintSupport)
elseif(ANDROID)
  set(plugins "")
elseif(UNIX)
  set(plugins Qt5::QXcbEglIntegrationPlugin)
elseif(WIN32)
  set(plugins "")
else()
  message(FATAL_ERROR "Not supported")
endif()

add_executable(qmlexample main.cpp)
target_link_libraries(
    qmlexample Qt5::Widgets Qt5::Quick Qt5::QTcpServerConnection ${plugins}
)

# Workaround for Linux's linker problems (*_MULTIPLICITY doesn't help, TODO) --
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
