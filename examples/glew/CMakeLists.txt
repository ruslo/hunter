# Copyright (c) 2016, Alexandre Pretyman

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")
project(glew-example)

hunter_add_package(glew)
find_package(glew CONFIG REQUIRED)

set(${PROJECT_NAME}_SOURCES
  glewinfo.c
)

if(MSVC)
  list(APPEND ${PROJECT_NAME}_SOURCES glewinfo.rc)
endif()

add_executable(${PROJECT_NAME}
    ${${PROJECT_NAME}_SOURCES}
)

target_link_libraries(${PROJECT_NAME} glew::glew)

