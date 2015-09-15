cmake_minimum_required (VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-dbus)

hunter_add_package(dbus)
find_package(dbus REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main
    dbus::dbus)


