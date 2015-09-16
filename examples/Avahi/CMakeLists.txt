cmake_minimum_required (VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-Avahi)

hunter_add_package(Avahi)
find_package(Avahi REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main 
  Avahi::common
  Avahi::client
  Avahi::compat_libdns_sd)
