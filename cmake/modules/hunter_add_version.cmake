# Copyright (c) 2013, 2015 Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_internal_error)
include(hunter_status_debug)

# If 'HUNTER_<name>_VERSION' is equal to 'h_VERSION', then
# this function will set 'HUNTER_<name>_URL' and 'HUNTER_<name>_SHA1'.
function(hunter_add_version)
  set(h_one_value PACKAGE_NAME VERSION URL SHA1)
  cmake_parse_arguments(h "" "${h_one_value}" "" ${ARGV})
  if(h_UNPARSED_ARGUMENTS)
    hunter_internal_error("unexpected argument: ${h_UNPARSED_ARGUMENTS}")
  endif()
  if(NOT h_PACKAGE_NAME)
    hunter_internal_error("PACKAGE_NAME can't be empty")
  endif()
  if(NOT h_VERSION)
    hunter_internal_error("VERSION can't be empty")
  endif()
  if(NOT h_URL)
    hunter_internal_error("URL can't be empty")
  endif()
  if(NOT h_SHA1)
    hunter_internal_error("SHA1 can't be empty")
  endif()

  # update HUNTER_<name>_VERSIONS (list of available versions)
  set(h_versions "HUNTER_${h_PACKAGE_NAME}_VERSIONS")
  list(APPEND ${h_versions} ${h_VERSION})

  # 'hunter.cmake' may be loaded several times
  list(REMOVE_DUPLICATES "${h_versions}")

  set(${h_versions} ${${h_versions}} PARENT_SCOPE)

  set(expected_version "HUNTER_${h_PACKAGE_NAME}_VERSION")
  string(COMPARE EQUAL "${${expected_version}}" "" version_is_empty)
  if(version_is_empty)
    hunter_internal_error(
        "HUNTER_<name>_VERSION can't be empty "
        "(${h_PACKAGE_NAME})"
        "(probably `hunter_config(...)` missing in config file)"
    )
  endif()
  string(COMPARE NOTEQUAL "${${expected_version}}" "${h_VERSION}" version_diff)
  if(version_diff)
    return()
  endif()

  # HUNTER_<name>_VERSION found
  set(h_url_name "HUNTER_${h_PACKAGE_NAME}_URL")
  set(h_sha1_name "HUNTER_${h_PACKAGE_NAME}_SHA1")

  set(${h_url_name} "${h_URL}" PARENT_SCOPE)
  set(${h_sha1_name} "${h_SHA1}" PARENT_SCOPE)
endfunction()
