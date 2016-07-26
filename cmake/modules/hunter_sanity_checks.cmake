# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

include(hunter_internal_error)
include(hunter_status_debug)

function(hunter_sanity_checks)
  # http://cgold.readthedocs.io/en/latest/tutorials/build-types.html
  string(COMPARE EQUAL "${CMAKE_CFG_INTDIR}" "." is_single)

  string(COMPARE EQUAL "${CMAKE_GENERATOR}" "" no_generator)
  if(no_generator)
    hunter_internal_error("CMAKE_GENERATOR is empty")
  endif()

  string(REGEX MATCH "^Visual Studio" vs_string "${CMAKE_GENERATOR}")
  string(COMPARE EQUAL "${vs_string}" "Visual Studio" is_visual_studio)

  string(COMPARE EQUAL "${CMAKE_GENERATOR}" "Xcode" is_xcode)
  string(COMPARE NOTEQUAL "${XCODE}" "" xcode_var_is_set)

  if(NOT is_xcode STREQUAL xcode_var_is_set)
    hunter_internal_error(
        "Inconsistent XCODE/CMAKE_GENERATOR: ${XCODE}/${CMAKE_GENERATOR}"
    )
  endif()

  if(MSVC_IDE AND NOT is_visual_studio)
    hunter_internal_error(
        "Inconsistent MSVC_IDE/CMAKE_GENERATOR: ${MSVC_IDE}/${CMAKE_GENERATOR}"
    )
  endif()

  if(is_xcode OR is_visual_studio)
    set(multiconfig_generator TRUE)
  else()
    set(multiconfig_generator FALSE)
  endif()

  set(good TRUE)
  if(is_single)
    if(multiconfig_generator)
      set(good FALSE)
    endif()
  else()
    if(NOT multiconfig_generator)
      set(good FALSE)
    endif()
  endif()

  if(NOT good)
    hunter_internal_error(
        "Inconsistent CMAKE_CFG_INTDIR/CMAKE_GENERATOR: ${CMAKE_CFG_INTDIR}/${CMAKE_GENERATOR}"
    )
  endif()

  if(is_single)
    hunter_status_debug("Single-configuration generator")
  else()
    hunter_status_debug("Multi-configuration generator")
  endif()
endfunction()
