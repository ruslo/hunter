cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-pybind11)

hunter_add_package(pybind11)

find_package(pybind11 CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main pybind11::pybind11 pybind11::embed pybind11::module)
