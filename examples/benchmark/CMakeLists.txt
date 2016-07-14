# Copyright (C) 2016, Dennis Sitelew
cmake_minimum_required(VERSION 3.0)

if(NOT CMAKE_BUILD_TYPE)
  message(WARNING "You shouldn't benchmark a debug build")
endif()

# Emulate HunterGate:
include("../common.cmake")
project(benchmark-example)

hunter_add_package(benchmark)
find_package(benchmark REQUIRED)

set(${PROJECT_NAME}_SOURCES main.cpp)
add_executable(${PROJECT_NAME} ${${PROJECT_NAME}_SOURCES})

target_link_libraries(${PROJECT_NAME} "benchmark::library")
