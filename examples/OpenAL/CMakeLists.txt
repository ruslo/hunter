cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-OpenAL)

hunter_add_package(OpenAL)

find_package(OpenAL CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main OpenAL::OpenAL)
