# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_LIST_DIR}/config.cmake)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-shaka_player_embedded)

if(IOS)
  # We need Obj-C
  set(sources boo.mm)
else()
  set(sources boo.cpp)
endif()

# DOCUMENTATION_START {
hunter_add_package(shaka_player_embedded)
find_package(shaka_player_embedded CONFIG REQUIRED)

add_executable(boo ${sources})
target_link_libraries(boo PUBLIC shaka_player_embedded::shaka_player_embedded)
# DOCUMENTATION_END }

if("${CMAKE_SYSTEM_NAME}" STREQUAL "Linux")
  # Workaround for GNU linker cyclic dependencies
  target_link_libraries(
      boo
      PUBLIC
      "-Wl,--start-group"
      v8::v8_base
      v8::v8_init
      v8::v8_initializers
      v8::v8_libbase
      v8::v8_libplatform
      v8::v8_libsampler
      v8::v8_nosnapshot
      "-Wl,--end-group"
  )
endif()

target_compile_definitions(boo PRIVATE OS_POSIX)

hunter_add_package(gflags)
find_package(gflags CONFIG REQUIRED)
target_link_libraries(boo PRIVATE gflags)
