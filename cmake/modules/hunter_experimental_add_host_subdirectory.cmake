# Copyright (c) 2016 Fabian Winnen
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
include(hunter_status_print)
include(hunter_status_debug)

function(hunter_experimental_add_host_subdirectory)
  cmake_parse_arguments(_arg "" BINARY_DIRECTORY ENV_VARS ${ARGV})

  # Get subdirectory home
  list(LENGTH _arg_UNPARSED_ARGUMENTS _len)
  if(NOT ${_len} EQUAL 1)
      hunter_internal_error(
              "'hunter_experimental_add_host_subdirectory' incorrect usage,"
              " expected one subdirectory argument"
      )
  endif()
  list(GET _arg_UNPARSED_ARGUMENTS 0 _home_directory)

  string(COMPARE EQUAL "${_arg_BINARY_DIRECTORY}" "" _binary_not_set)
  if (_binary_not_set)
      set (_arg_BINARY_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/host-build")
  endif ()

  hunter_status_print("invoke cmake subdirectory '${_home_directory}' build for host...\n\n")
  hunter_status_print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")

  # TODO: Check why this is needed only for Android
  # save and unset specified ENV variables
  foreach(var ${_arg_ENV_VARS})
      hunter_status_debug("save ${var}: $ENV{${var}}")
      set(_saved_${var} $ENV{${var}})
      unset(ENV{${var}})
  endforeach()

  # invoke cmake for host project
  execute_process(
          COMMAND "${CMAKE_COMMAND}" "-H${_home_directory}" "-B${_arg_BINARY_DIRECTORY}"
          RESULT_VARIABLE _exit_code
  )
  string(COMPARE EQUAL "${_exit_code}" "0" _success)
  if(NOT ${_success})
      hunter_internal_error("Failed to generate host project, exit status ${_exit_code}.")
  endif()

  # restore specified ENV variables
  foreach(var ${_arg_ENV_VARS})
    set(ENV{${var}} ${_saved_${var}})
    hunter_status_debug("restored ${var}: $ENV{${var}}")
    unset(_saved_${var})
  endforeach()

  hunter_status_print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n\n")
  hunter_status_print("finished build host subdirectory in '${_arg_BINARY_DIRECTORY}'")
endfunction()
