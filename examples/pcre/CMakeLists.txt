cmake_minimum_required (VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(dowload-pcre)

hunter_add_package(pcre)
find_package(pcre)

add_executable(main main.c)

target_link_libraries(main
  pcre::pcre)
