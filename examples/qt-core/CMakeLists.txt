cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(qt-widgets)

hunter_add_package(Qt) # Qt5Core
find_package(Qt5Core REQUIRED) # Qt5::Core

add_executable(helloworld main.cpp)
target_link_libraries(helloworld Qt5::Core)

if(IOS)
  find_package(Qt5Gui REQUIRED) # Qt5::QIOSIntegrationPlugin
  target_link_libraries(helloworld Qt5::QIOSIntegrationPlugin)
endif()
