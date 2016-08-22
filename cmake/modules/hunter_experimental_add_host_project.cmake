# Copyright (c) 2016 Fabian Winnen
# All rights reserved.
#
# Warning:
#   This module is in experimental stage.
#   TODO: more disclamers
#   TODO: notice that we clear some env variables?
#
# Adds a project with CMakeList.txt as seperate build with default (host) toolchain
#
# Usage:
#   hunter_experimental_add_host_project(host)
#
# sets HUNTER_HOST_ROOT variable to point at host project's binary directory
message(WARNING "You are using a hunter module in experimental stage:\nhunter_experimental_add_host_project\n")

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_internal_error)
include(hunter_status_print)
include(hunter_status_debug)

function(hunter_experimental_add_host_project)
  cmake_parse_arguments(_arg "" "" "" ${ARGV})

  # Get subdirectory home
  list(LENGTH _arg_UNPARSED_ARGUMENTS _len)
  if(NOT ${_len} EQUAL 1)
      hunter_internal_error(
              "'hunter_experimental_add_host_project' incorrect usage,"
              " expected one project argument"
      )
  endif()
  list(GET _arg_UNPARSED_ARGUMENTS 0 _home_directory)

  set(_binary_directory "${CMAKE_BINARY_DIR}/_3rdParty/Hunter/host-build-binary-tree")

  hunter_status_print("invoke cmake subdirectory '${_home_directory}' build for host...\n\n")
  hunter_status_print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")

  # invoke cmake for host project
  # TODO: I guess this is not portable ?! how do access HUNTER_SELF?
  include(../../scripts/clear-all.cmake)
  execute_process(
          COMMAND "${CMAKE_COMMAND}" "-H${_home_directory}" "-B${_binary_directory}"
          RESULT_VARIABLE _exit_code
  )
  string(COMPARE EQUAL "${_exit_code}" "0" _success)
  if(NOT ${_success})
      hunter_internal_error("Failed to generate host project, exit status ${_exit_code}.")
  endif()

  # read host projects install root
  if(NOT EXISTS "${_binary_directory}/_3rdParty/Hunter/install-root-dir")
      hunter_internal_error(
              "Could not read file 'install-root-dir'."
              "Create this file at the end of your host project's CMakeList.txt with:"
              "  'file(WRITE \"\${CMAKE_BINARY_DIR}/_3rdParty/Hunter/install-root-dir\" \"\${<Package>_ROOT}\")'"
      )
  endif()
  file(READ "${_binary_directory}/_3rdParty/Hunter/install-root-dir" HUNTER_HOST_ROOT)
  set(HUNTER_HOST_ROOT "${HUNTER_HOST_ROOT}" PARENT_SCOPE)

  hunter_status_print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n\n")
  hunter_status_print("finished build host project in '${_binary_directory}'")
endfunction()
