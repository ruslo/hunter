# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_internal_error)
include(hunter_user_error)

# Test examples:
# * opengles
function(hunter_find_helper_framework)
  set(optional "")
  set(one FRAMEWORK)
  set(multiple "")

  # Introduce:
  # * x_FRAMEWORK
  cmake_parse_arguments(x "${optional}" "${one}" "${multiple}" "${ARGV}")

  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_internal_error(FATAL_ERROR "Unparsed arguments: ${x_UNPARSED_ARGUMENTS}")
  endif()

  string(COMPARE EQUAL "${x_FRAMEWORK}" "" is_empty)
  if(is_empty)
    hunter_internal_error("No FRAMEWORK")
  endif()

  string(COMPARE EQUAL "${CMAKE_FIND_PACKAGE_NAME}" "" is_empty)
  if(is_empty)
    hunter_internal_error("CMAKE_FIND_PACKAGE_NAME is empty")
  endif()

  set(package_name "${CMAKE_FIND_PACKAGE_NAME}")

  get_filename_component(parent_name "${CMAKE_PARENT_LIST_FILE}" NAME)
  string(COMPARE EQUAL "${parent_name}" "Find${package_name}.cmake" is_equal)
  if(NOT is_equal)
    hunter_internal_error("Unexpected filename: ${CMAKE_PARENT_LIST_FILE}")
  endif()

  set(err_msg "'find_package(${package_name})' should be called")

  if(NOT ${package_name}_FIND_REQUIRED)
    hunter_user_error("${err_msg} with REQUIRED")
  endif()

  if(${package_name}_FIND_QUIETLY)
    hunter_user_error("${err_msg} without QUIET")
  endif()

  string(COMPARE EQUAL "${${package_name}_FIND_VERSION}" "" is_empty)
  if(NOT is_empty)
    hunter_user_error("${err_msg} without version")
  endif()

  string(COMPARE EQUAL "${${package_name}_FIND_COMPONENTS}" "" is_empty)
  if(NOT is_empty)
    hunter_user_error("${err_msg} without components")
  endif()

  set(target_name "${package_name}::${package_name}")
  if(TARGET "${target_name}")
    return()
  endif()

  add_library("${target_name}" IMPORTED INTERFACE)

  set_target_properties(
      "${target_name}"
      PROPERTIES
      INTERFACE_LINK_LIBRARIES
      "-framework ${x_FRAMEWORK}"
  )
endfunction()
