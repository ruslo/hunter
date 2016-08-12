# Copyright (c) 2016, Alexandre Pretyman

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")
project(glm-example)

hunter_add_package(glm)
find_package(glm REQUIRED)

set(${PROJECT_NAME}_SOURCES
  core_func_common.cpp
)

add_executable(${PROJECT_NAME}
    ${${PROJECT_NAME}_SOURCES}
)

target_link_libraries(${PROJECT_NAME} PRIVATE glm)

