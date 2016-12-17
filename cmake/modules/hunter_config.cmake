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
  set(_hunter_one_value VERSION REPOSITORY_DIR REPOSITORY_NAME REPOSITORY_VERSION)
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

  if(_hunter_REPOSITORY_DIR)
    if(_hunter_REPOSITORY_NAME OR _hunter_REPOSITORY_VERSION)
      hunter_internal_error(
          "Repository can be specified by directory or name+version, not both"
      )
    endif()
  elseif(_hunter_REPOSITORY_NAME AND NOT _hunter_REPOSITORY_VERSION)
    hunter_internal_error(
        "Repository name requires repository version as well"
    )
  elseif(_hunter_REPOSITORY_VERSION AND NOT _hunter_REPOSITORY_NAME)
    hunter_internal_error(
        "Repository version requires repository name as well"
    )
  elseif(_hunter_REPOSITORY_VERSION AND _hunter_REPOSITORY_NAME)
    set(reponame "${_hunter_REPOSITORY_NAME}-${_hunter_REPOSITORY_VERSION}")
    string(REGEX REPLACE "\\." "_" reponame "${reponame}")
    if(NOT "${reponame}" MATCHES "[-a-zA-Z0-9._]*")
      hunter_internal_error("Repository name not specified correctly")
    endif()
    if(NOT HUNTER_REPOSITORY_${reponame}_DIRECTORY)
      hunter_internal_error("Could not find repository ${reponame}")
    endif()
    set(_hunter_REPOSITORY_DIR "${HUNTER_REPOSITORY_${reponame}_DIRECTORY}")
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
    if(_hunter_REPOSITORY_DIR)
      set(
          HUNTER_${_hunter_current_project}_REPOSITORY
          ${_hunter_REPOSITORY_DIR}
      )
    else()
      unset(HUNTER_${_hunter_current_project}_REPOSITORY)
    endif()
  else()
    hunter_user_error("Expected VERSION option for 'hunter_config' command")
  endif()
endmacro()
