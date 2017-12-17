# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-lua)

# DOCUMENTATION_START_0 {
hunter_add_package(Lua)
find_package(Lua CONFIG REQUIRED)
# DOCUMENTATION_END_0 }

if(NOT TARGET Lua::lua)
  message(FATAL_ERROR "Target Lua::lua not found")
endif()

# DOCUMENTATION_START_1 {
# Imported target can be used as-is
# in "build time" commands like 'add_custom_target'
add_custom_target(
    show_lua_version
    Lua::lua -v
    COMMENT "Show version of Lua executable"
)
# DOCUMENTATION_END_1 }

# DOCUMENTATION_START_2 {
# Full path to executable 'LUA_EXECUTABLE' should be used
# for "generate time" commands like 'execute_process'
execute_process(
    COMMAND ${LUA_EXECUTABLE} -v
    RESULT_VARIABLE result
    OUTPUT_VARIABLE output
    ERROR_VARIABLE error
    OUTPUT_STRIP_TRAILING_WHITESPACE
    ERROR_STRIP_TRAILING_WHITESPACE
)
# DOCUMENTATION_END_2 }

if(NOT result EQUAL "0")
  message(
      FATAL_ERROR
      "lua failed\n"
      "result:\n"
      "  ${result}\n"
      "output:\n"
      "  ${output}\n"
      "error:\n"
      "  ${error}\n"
  )
endif()

message("Lua version: ${output}")

add_library(boo boo.cpp)

# DOCUMENTATION_START_3 {
# Library usage
target_link_libraries(boo PUBLIC Lua::lua_lib)
# DOCUMENTATION_END_3 }
