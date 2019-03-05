# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_assert_empty_string)
include(hunter_assert_not_empty_string)
include(hunter_fatal_error)
include(hunter_internal_error)

function(hunter_default_version package)
  hunter_assert_not_empty_string("${package}")

  set(optional "")
  set(one VERSION)
  set(multiple "")

  # Introduce:
  # * x_VERSION
  cmake_parse_arguments(x "${optional}" "${one}" "${multiple}" "${ARGN}")

  hunter_assert_empty_string("${x_UNPARSED_ARGUMENTS}")

  hunter_assert_not_empty_string("${x_VERSION}")

  if(NOT __HUNTER_ALLOW_DEFAULT_VERSION_LOADING)
    hunter_fatal_error(
        "Unexpected 'hunter_default_version' usage from:"
        "  ${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE}"
        ERROR_PAGE "error.unexpected.hunter_config"
    )
  endif()

  set(last_name "${__HUNTER_LAST_DEFAULT_VERSION_NAME}")
  if(NOT last_name STREQUAL "")
    if(package STREQUAL last_name)
      hunter_internal_error("'${package}' specified twice")
    endif()

    if(package STRLESS last_name)
      hunter_internal_error(
          "Alphabetical order violation:"
          " '${package}' should appear before '${last_name}'"
      )
    endif()
  endif()

  set(__HUNTER_LAST_DEFAULT_VERSION_NAME "${package}" PARENT_SCOPE)

  set("HUNTER_${package}_VERSION" "${x_VERSION}" PARENT_SCOPE)
endfunction()
