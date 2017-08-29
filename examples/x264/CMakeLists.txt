# Copyright (c) 2017, Alexandre Pretyman

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")
include(hunter_pkgconfig_export_target)

project(x264-example)

hunter_add_package(x264)
find_package(x264 CONFIG REQUIRED)

set(${PROJECT_NAME}_SOURCES
  example.c
)

add_executable(${PROJECT_NAME}
    ${${PROJECT_NAME}_SOURCES}
)

target_link_libraries(${PROJECT_NAME} PkgConfig::x264)

