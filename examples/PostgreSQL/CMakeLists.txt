# Copyright (c) 2016, Alexandre Pretyman
cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")
project(PostgreSQL-example)

hunter_add_package(PostgreSQL)
find_package(PostgreSQL REQUIRED)

set(${PROJECT_NAME}_SOURCES
  main.c
)

add_executable(${PROJECT_NAME}
    ${${PROJECT_NAME}_SOURCES}
)

target_link_libraries(${PROJECT_NAME} "PostgreSQL::libpq")

