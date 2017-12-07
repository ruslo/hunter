cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-lmdbxx)

hunter_add_package(lmdbxx)

find_package(lmdbxx CONFIG REQUIRED)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
add_executable(main main.cpp)
target_link_libraries(main lmdbxx::lmdbxx)
