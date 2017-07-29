# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_internal_error)
include(hunter_status_debug)
include(hunter_user_error)

# Test examples:
# * android
# * android_log
# * egl
# * glapi
# * gles2
# * gles3
# * osmesa
function(hunter_find_helper)
  set(optional "")
  set(one LIBRARY HEADER)
  set(multiple "")

  # Introduce:
  # * x_LIBRARY
  # * x_HEADER
  cmake_parse_arguments(x "${optional}" "${one}" "${multiple}" "${ARGV}")

  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_internal_error(FATAL_ERROR "Unparsed arguments: ${x_UNPARSED_ARGUMENTS}")
  endif()

  string(COMPARE EQUAL "${x_LIBRARY}" "" is_empty)
  if(is_empty)
    hunter_internal_error("No LIBRARY")
  endif()

  string(COMPARE EQUAL "${x_HEADER}" "" is_empty)
  if(is_empty)
    hunter_internal_error("No HEADER")
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

  add_library("${target_name}" UNKNOWN IMPORTED)

  unset(_hunter_library CACHE)
  unset(_hunter_header CACHE)

  find_library(_hunter_library "${x_LIBRARY}")
  find_path(_hunter_header "${x_HEADER}")

  set(wiki "https://github.com/ruslo/hunter/wiki/pkg.${package_name}")
  set(details "See ${wiki} for details.")

  if(NOT _hunter_library)
    hunter_user_error("Library '${x_LIBRARY}' not found in system. ${details}")
  endif()

  if(NOT _hunter_header)
    hunter_user_error("Header '${x_HEADER}' not found in system. ${details}")
  endif()

  hunter_status_debug("Creating target '${target_name}':")
  hunter_status_debug("* library: '${_hunter_library}'")
  hunter_status_debug("* header: '${_hunter_header}'")

  set_target_properties(
      "${target_name}"
      PROPERTIES
      IMPORTED_LINK_INTERFACE_LANGUAGE "CXX"
      IMPORTED_LOCATION "${_hunter_library}"
      INTERFACE_INCLUDE_DIRECTORIES "${_hunter_header}"
  )

  unset(_hunter_library CACHE)
  unset(_hunter_header CACHE)
endfunction()
