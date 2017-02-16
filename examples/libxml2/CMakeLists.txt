# Copyright (c) 2016, Alexandre Pretyman
cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")
project(libxml2-example)

hunter_add_package(libxml2)
find_package(libxml2 CONFIG REQUIRED)

set(${PROJECT_NAME}_SOURCES
  main.c
)

add_executable(${PROJECT_NAME}
    ${${PROJECT_NAME}_SOURCES}
)

include_directories(${LIBXML2_INCLUDE_DIRS})

target_link_libraries(${PROJECT_NAME} ${LIBXML2_LIBRARIES})

