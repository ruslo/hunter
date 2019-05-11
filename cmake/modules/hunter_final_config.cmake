# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_assert_empty_string)
include(hunter_assert_not_empty_string)

function(hunter_final_config)
  set(optional KEEP_PACKAGE_SOURCES)
  set(one PACKAGE SHA1 VERSION URL )
  set(multiple CMAKE_ARGS CONFIGURATION_TYPES)

  # Introduce:
  # * x_KEEP_PACKAGE_SOURCES
  # * x_PACKAGE
  # * x_SHA1
  # * x_VERSION
  # * x_URL
  # * x_CMAKE_ARGS
  # * x_CONFIGURATION_TYPES
  cmake_parse_arguments(x "${optional}" "${one}" "${multiple}" "${ARGV}")

  hunter_assert_empty_string("${x_UNPARSED_ARGUMENTS}")

  hunter_assert_not_empty_string("${x_PACKAGE}")
  hunter_assert_not_empty_string("${x_VERSION}")

  set(package "${x_PACKAGE}")

  set("HUNTER_${package}_VERSION" "${x_VERSION}" PARENT_SCOPE)

  if(NOT "${x_SHA1}" STREQUAL "")
    set("__HUNTER_FINAL_SHA1_${package}" "${x_SHA1}" PARENT_SCOPE)
  endif()

  if(NOT "${x_CMAKE_ARGS}" STREQUAL "")
    set("__HUNTER_FINAL_CMAKE_ARGS_${package}" "${x_CMAKE_ARGS}" PARENT_SCOPE)
  endif()

  if(NOT "${x_CONFIGURATION_TYPES}" STREQUAL "")
    set(
        "__HUNTER_FINAL_CONFIGURATION_TYPES_${package}"
        "${x_CONFIGURATION_TYPES}"
        PARENT_SCOPE
    )
  endif()

  if(NOT "${x_URL}" STREQUAL "")
    set("__HUNTER_FINAL_URL_${package}" "${x_URL}" PARENT_SCOPE)
  endif()

  if(x_KEEP_PACKAGE_SOURCES)
    set("__HUNTER_FINAL_KEEP_PACKAGE_SOURCES_${package}" TRUE PARENT_SCOPE)
  endif()

  string(TOUPPER "${package}" package_upper)
  set(package_root "${package_upper}_ROOT")

  hunter_unsetvar("${package_root}")
  set("${package_root}" "" PARENT_SCOPE)
endfunction()
