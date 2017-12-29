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
target_link_libraries(qmlexample PUBLIC Qt5::Widgets Qt5::Quick ${plugins})

if(TARGET Qt5::QTcpServerConnection)
  target_link_libraries(qmlexample PUBLIC Qt5::QTcpServerConnection)
endif()
