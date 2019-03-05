# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_internal_error)
include(hunter_status_debug)
include(hunter_assert_not_empty_string)

function(hunter_create_dependency_entry)
  set(one PACKAGE COMPONENT RESULT)
  cmake_parse_arguments(x "" "${one}" "" "${ARGV}")
  # x_PACKAGE package need to be processed
  # x_COMPONENT optional component
  # x_RESULT optional component

  hunter_assert_not_empty_string("${x_PACKAGE}")
  hunter_assert_not_empty_string("${x_RESULT}")
  hunter_assert_not_empty_string("${HUNTER_CONFIG_ID_PATH}")

  string(COMPARE NOTEQUAL "${x_COMPONENT}" "" has_component)
  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_internal_error("Unparsed: ${x_UNPARSED_ARGUMENTS}")
  endif()

  set(top_dir "${HUNTER_CONFIG_ID_PATH}/Build")

  set(dep_dir "${top_dir}/${x_PACKAGE}")
  if(has_component)
    set(dep_dir "${dep_dir}/__${x_COMPONENT}")
  endif()
  set(cache_file "${dep_dir}/cache.sha1")

  if(NOT EXISTS "${cache_file}")
    hunter_status_debug("Cache file not found: ${cache_file}")
    set("${x_RESULT}" "" PARENT_SCOPE)
    return()
  endif()

  file(READ "${cache_file}" sha1)
  if(has_component)
    set("${x_RESULT}" "${x_PACKAGE} ${x_COMPONENT} ${sha1}" PARENT_SCOPE)
  else()
    set("${x_RESULT}" "${x_PACKAGE} ${sha1}" PARENT_SCOPE)
  endif()
endfunction()
