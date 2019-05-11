cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-jaegertracing)

hunter_add_package(jaegertracing)

# DOCUMENTATION_START {
find_package(jaegertracing CONFIG REQUIRED)
add_executable(main main.cpp)
target_link_libraries(main jaegertracing::jaegertracing-static)
# DOCUMENTATION_END }
