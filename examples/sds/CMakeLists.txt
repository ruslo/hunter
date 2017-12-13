cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-sds)

hunter_add_package(sds)

find_package(sds CONFIG REQUIRED)

add_executable(main main.c)
target_link_libraries(main sds::sds)
