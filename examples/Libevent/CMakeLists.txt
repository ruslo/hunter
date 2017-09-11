cmake_minimum_required(VERSION 3.0)

include("../common.cmake")

project(download-libevent)

hunter_add_package(Libevent)

find_package(Libevent CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main Libevent::event_core
                           Libevent::event_extra)
