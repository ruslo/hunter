cmake_minimum_required (VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-giflib)

hunter_add_package(giflib)
find_package(giflib REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main
  giflib)
