# Copyright (c) 2013, 2015 Ruslan Baratov
# All rights reserved.

# Adds a subdirectory with CMakeList.txt as seperate build with default (host) toolchain

# Usage:
#   hunter_add_host_subdirectory(host)
#   hunter_add_host_subdirectory(host
#       BINARY_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/host-build
#       ENV_VARS CC CXX
#   )

# Note:
#   With polly Android toolchain this fails if you do not unset CC and CXX ENV{} variables.
#   For this and possible other dependent ENV variables you can ue ENV_VARS.
#   Every entry in ENV_VARS will get saved and unset for the host project and restored
#   after the host project build finished

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_internal_error)

# internal variables: _hunter_ahs_*
macro(hunter_add_host_subdirectory)
  cmake_parse_arguments(_hunter_ahs_arg "" BINARY_DIRECTORY ENV_VARS ${ARGV})

  # Get subdirectory home
  list(LENGTH _hunter_ahs_arg_UNPARSED_ARGUMENTS _hunter_ahs_len)
  if(NOT ${_hunter_ahs_len} EQUAL 1)
      hunter_internal_error(
              "'hunter_add_host_subdirectory' incorrect usage,"
              " expected one subdirectory argument"
      )
  endif()
  list(GET _hunter_ahs_arg_UNPARSED_ARGUMENTS 0 _hunter_ahs_HOME_DIRECTORY)

  string(COMPARE EQUAL "${_hunter_ahs_arg_BINARY_DIRECTORY}" "" _hunter_ahs_binary_not_set)
  if (_hunter_ahs_binary_not_set)
      set (_hunter_ahs_arg_BINARY_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/host-build")
  endif ()

  message(STATUS "[hunter] invoke cmake subdirectory '${_hunter_ahs_HOME_DIRECTORY}' build for host...\n\n")
  message(STATUS ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")

  # TODO: Check why this is needed only for Android
  # save and unset specified ENV variables
  foreach(var ${_hunter_ahs_arg_ENV_VARS})
      #message(STATUS "save ${var}: $ENV{${var}}")
      set(_hunter_ahs_saved_${var} $ENV{${var}})
      unset(ENV{${var}})
  endforeach()

  # invoke cmake for host project
  execute_process(COMMAND "${CMAKE_COMMAND}" -E make_directory "${_hunter_ahs_arg_BINARY_DIRECTORY}")
  execute_process(COMMAND "${CMAKE_COMMAND}" "-H${_hunter_ahs_HOME_DIRECTORY}" "-B${_hunter_ahs_arg_BINARY_DIRECTORY}")
  execute_process(COMMAND "${CMAKE_COMMAND}" --build "${_hunter_ahs_arg_BINARY_DIRECTORY}")

  # restore specified ENV variables
  foreach(var ${_hunter_ahs_arg_ENV_VARS})
    set(ENV{${var}} ${_hunter_ahs_saved_${var}})
    # message(STATUS "restored ${var}: $ENV{${var}}")
    unset(_hunter_ahs_saved_${var})
  endforeach()

  message(STATUS "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n\n")
  message(STATUS "[hunter] finished build host subdirectory in '${_hunter_ahs_arg_BINARY_DIRECTORY}'")
endmacro()
