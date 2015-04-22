# Copyright (c) 2013-2015, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_fatal_error)
include(hunter_unsetvar)
include(hunter_user_error)

macro(hunter_config)
  if(NOT HUNTER_ALLOW_CONFIG_LOADING)
    hunter_fatal_error(
        "Unexpected 'hunter_config' usage from:"
        "  ${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE}"
        WIKI
        "error.unexpected.hunter_config"
    )
  endif()
  set(_hunter_one_value VERSION)
  set(_hunter_multiple_values CMAKE_ARGS CONFIGURATION_TYPES)
  cmake_parse_arguments(
      _hunter
      ""
      "${_hunter_one_value}"
      "${_hunter_multiple_values}"
      ${ARGV}
  )
  list(LENGTH _hunter_UNPARSED_ARGUMENTS _hunter_len)
  if(NOT ${_hunter_len} EQUAL 1)
    hunter_user_error(
        "Unparsed arguments for 'hunter_config' command: "
        "${_hunter_UNPARSED_ARGUMENTS}"
    )
  endif()

  # calc <NAME>_ROOT
  list(GET _hunter_UNPARSED_ARGUMENTS 0 _hunter_current_project)
  string(TOUPPER "${_hunter_current_project}" _hunter_root)
  set(_hunter_root "${_hunter_root}_ROOT")

  # clear all
  hunter_unsetvar(${_hunter_root})

  if(_hunter_VERSION)
    set(HUNTER_${_hunter_current_project}_VERSION ${_hunter_VERSION})
    set(HUNTER_${_hunter_current_project}_CMAKE_ARGS ${_hunter_CMAKE_ARGS})
    set(
        HUNTER_${_hunter_current_project}_CONFIGURATION_TYPES
        ${_hunter_CONFIGURATION_TYPES}
    )
  else()
    hunter_user_error("Expected VERSION option for 'hunter_config' command")
  endif()
endmacro()
