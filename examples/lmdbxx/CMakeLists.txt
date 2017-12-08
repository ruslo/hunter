cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-lmdbxx)

hunter_add_package(lmdbxx)

find_package(lmdbxx CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main lmdbxx::lmdbxx)
