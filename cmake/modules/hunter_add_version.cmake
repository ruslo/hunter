# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # CMAKE_PARSE_ARGUMENTS

include(hunter_fatal_error)
include(hunter_status_debug)

# If 'HUNTER_<name>_VERSION' is equal to 'h_VERSION', then
# this function will set 'HUNTER_<name>_URL' and 'HUNTER_<name>_SHA1'.
function(hunter_add_version)
  set(h_one_value PACKAGE_NAME VERSION URL SHA1)
  CMAKE_PARSE_ARGUMENTS(h "" "${h_one_value}" "" ${ARGV})
  if(h_UNPARSED_ARGUMENTS)
    hunter_fatal_error("unexpected argument: ${h_UNPARSED_ARGUMENTS}")
  endif()
  if(NOT h_PACKAGE_NAME)
    hunter_fatal_error("PACKAGE_NAME can't be empty")
  endif()
  if(NOT h_VERSION)
    hunter_fatal_error("VERSION can't be empty")
  endif()
  if(NOT h_URL)
    hunter_fatal_error("URL can't be empty")
  endif()
  if(NOT h_SHA1)
    hunter_fatal_error("SHA1 can't be empty")
  endif()

  # update HUNTER_<name>_VERSIONS (list of available versions)
  set(h_versions "HUNTER_${h_PACKAGE_NAME}_VERSIONS")
  list(APPEND ${h_versions} ${h_VERSION})
  set(${h_versions} ${${h_versions}} PARENT_SCOPE)

  # check <NAME>_ROOT (if already set, then skip)
  string(TOUPPER ${h_PACKAGE_NAME} h_root)
  set(h_root "${h_root}_ROOT")
  if(NOT "${${h_root}}" STREQUAL "")
    hunter_status_debug("Skip '${h_VERSION}' (root is set)")
    return()
  endif()

  set(expected_version "HUNTER_${h_PACKAGE_NAME}_VERSION")
  if("${${expected_version}}" STREQUAL "")
    hunter_fatal_error(
        "Both <NAME>_ROOT and HUNTER_<name>_VERSION can't be empty "
        "(${h_PACKAGE_NAME})"
    )
  endif()
  if(NOT "${${expected_version}}" STREQUAL "${h_VERSION}")
    hunter_status_debug("Skip '${h_VERSION}' (not equal)")
    return()
  endif()

  # <NAME>_ROOT not set and HUNTER_<name>_VERSION found
  set(h_url_name "HUNTER_${h_PACKAGE_NAME}_URL")
  set(h_sha1_name "HUNTER_${h_PACKAGE_NAME}_SHA1")

  set(${h_url_name} ${h_URL} PARENT_SCOPE)
  set(${h_sha1_name} ${h_SHA1} PARENT_SCOPE)
endfunction()
