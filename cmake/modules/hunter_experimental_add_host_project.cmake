# Copyright (c) 2016 Fabian Winnen
# All rights reserved.
#
# ************************* !!! WARNING !!! *************************
#
# You're using experimental feature. This may not work well
# and can be removed anytime. It's a workaround for existing
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

include(hunter_status_debug)
include(hunter_status_print)
include(hunter_assert_not_empty_string)
include(hunter_user_error)

function(hunter_experimental_add_host_project)
  hunter_assert_not_empty_string("${HUNTER_CACHED_ROOT}")
  hunter_assert_not_empty_string("${HUNTER_SHA1}")
  hunter_assert_not_empty_string("${HUNTER_URL}")

  hunter_status_print("
************************* !!! WARNING !!! *************************

You're using experimental feature. This may not work well
and can be removed anytime. It's a workaround for existing
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

  # check if home is out-of-source
  get_filename_component(home_directory_real "${home_directory}" REALPATH BASE_DIR "${CMAKE_CURRENT_LIST_DIR}")
  file(RELATIVE_PATH home_directory_relative "${CMAKE_CURRENT_LIST_DIR}" "${home_directory_real}")
  if ("${home_directory_relative}" MATCHES "[..].*")
    hunter_user_error("Out-of-tree host projects are not allowed.")
  endif()
  # Interpret a relative path with respect to the current source directory (of caller)
  set(home_directory "${CMAKE_CURRENT_LIST_DIR}/${home_directory_relative}")

  set(binary_directory "${CMAKE_CURRENT_BINARY_DIR}/_3rdParty/Hunter/host-build-binary-tree/${home_directory_relative}")

  hunter_status_print("Building host project: ${home_directory}")

  string(COMPARE EQUAL "${HUNTER_EXPERIMENTAL_HOST_GENERATOR}" "" no_generator)
  if(no_generator)
    set(host_generator "")
    hunter_status_debug("Using default host generator")
  else()
    hunter_status_debug("Using host generator: ${HUNTER_EXPERIMENTAL_HOST_GENERATOR}")
    set(host_generator -G${HUNTER_EXPERIMENTAL_HOST_GENERATOR})
  endif()

  # invoke cmake for host project
  include(${HUNTER_SELF}/scripts/clear-all.cmake)
  execute_process(
      COMMAND
          "${CMAKE_COMMAND}"
          "-H${home_directory}"
          "-B${binary_directory}"
          "-DHUNTER_HOST_URL=${HUNTER_URL}"
          "-DHUNTER_HOST_SHA1=${HUNTER_SHA1}"
          "-DHUNTER_ROOT=${HUNTER_CACHED_ROOT}"
          "-DHUNTER_ALREADY_LOCKED_DIRECTORIES=${HUNTER_ALREADY_LOCKED_DIRECTORIES}"
          "-DHUNTER_CACHE_SERVERS=${HUNTER_CACHE_SERVERS}"
          ${host_generator}
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
