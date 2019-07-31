cmake_minimum_required(VERSION 3.2)

include("../common.cmake")

project(download-libxdg-basedir)

# DOCUMENTATION_START {
hunter_add_package(libxdg-basedir)
find_package(libxdg-basedir CONFIG REQUIRED)

add_executable(example example.cpp)
target_link_libraries(example PUBLIC PkgConfig::libxdg-basedir)
# DOCUMENTATION_END }
