# Copyright (c) 2016 Fabian Winnen
# All rights reserved.
#
# ************************* !!! WARNING !!! *************************
#
# You're using experimental feature. This may not work well
# and can be removed anytime. It's a workaround for existsing
# feature request:
#
# https://github.com/ruslo/hunter/issues/495
#
# *******************************************************************
#
# Adds a project with CMakeList.txt as seperate build with default (host) toolchain
#
# Usage:
#   hunter_experimental_add_host_project(host)
#
# sets HUNTER_HOST_ROOT variable to point at host project's binary directory

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_user_error)
include(hunter_status_print)
include(hunter_status_debug)

function(hunter_experimental_add_host_project)
  hunter_status_print("
************************* !!! WARNING !!! *************************

You're using experimental feature. This may not work well
and can be removed anytime. It's a workaround for existsing
feature request:

https://github.com/ruslo/hunter/issues/495

*******************************************************************"
      )

  cmake_parse_arguments(arg "" "" "" ${ARGV})

  # Get subdirectory home
  list(LENGTH arg_UNPARSED_ARGUMENTS len)
  if(NOT ${len} EQUAL 1)
    hunter_user_error(
        "'hunter_experimental_add_host_project' incorrect usage,"
        " expected one project argument"
    )
  endif()
  list(GET arg_UNPARSED_ARGUMENTS 0 home_directory)

  set(binary_directory "${CMAKE_BINARY_DIR}/_3rdParty/Hunter/host-build-binary-tree")

  hunter_status_print("Building host project: ${home_directory}")

  # invoke cmake for host project
  include(${HUNTER_SELF}/scripts/clear-all.cmake)
  execute_process(
      COMMAND "${CMAKE_COMMAND}" "-H${home_directory}" "-B${binary_directory}"
      RESULT_VARIABLE exit_code
  )
  string(COMPARE EQUAL "${exit_code}" "0" success)
  if(NOT ${success})
    hunter_user_error("Failed to generate host project: ${home_directory}, exit status ${exit_code}.")
  endif()

  # read host projects install root
  if(NOT EXISTS "${binary_directory}/_3rdParty/Hunter/install-root-dir")
    hunter_user_error(
        "Could not read file 'install-root-dir'."
        "The host project must add dependencies with hunter."
    )
  endif()
  file(READ "${binary_directory}/_3rdParty/Hunter/install-root-dir" HUNTER_HOST_ROOT)
  set(HUNTER_HOST_ROOT "${HUNTER_HOST_ROOT}" PARENT_SCOPE)

  hunter_status_print("Host project build finished: ${home_directory}")
endfunction()
