# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_assert_empty_string)
include(hunter_status_debug)
include(hunter_assert_not_empty_string)

function(hunter_get_cmake_args)
  set(optional "")
  set(one PACKAGE OUT)
  set(multiple "")

  # Introduce:
  # * x_PACKAGE
  # * x_OUT
  cmake_parse_arguments(x "${optional}" "${one}" "${multiple}" "${ARGV}")

  hunter_assert_empty_string("${x_UNPARSED_ARGUMENTS}")

  hunter_assert_not_empty_string("${x_PACKAGE}")
  hunter_assert_not_empty_string("${x_OUT}")

  set(default_args "${__HUNTER_DEFAULT_CMAKE_ARGS_${x_PACKAGE}}")
  set(user_args "${__HUNTER_FINAL_CMAKE_ARGS_${x_PACKAGE}}")

  set(cmake_args "")

  # Lowest priority: CMAKE_ARGS from 'hunter.cmake'
  if(NOT default_args STREQUAL "")
    hunter_status_debug(
        "Package '${x_PACKAGE}' default arguments: '${default_args}'"
    )
    list(APPEND cmake_args "${default_args}")
  endif()

  # Priority is higher than default CMAKE_ARGS from 'hunter.cmake' but
  # lower than user's CMAKE_ARGS from 'config.cmake'
  if(NOT "${HUNTER_CACHED_BUILD_SHARED_LIBS}" STREQUAL "")
    list(
        APPEND
        cmake_args
        "BUILD_SHARED_LIBS=${HUNTER_CACHED_BUILD_SHARED_LIBS}"
    )
  endif()

  # Highest priority: CMAKE_ARGS from user's 'config.cmake'
  if(NOT user_args STREQUAL "")
    hunter_status_debug(
        "Package '${x_PACKAGE}' user arguments: '${user_args}'"
    )
    list(APPEND cmake_args "${user_args}")
  endif()

  set("${x_OUT}" "${cmake_args}" PARENT_SCOPE)
endfunction()
