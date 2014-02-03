# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

# Try to find CppNetlib library
#
# Input variables:
#     CPPNETLIB_ROOT - CppNetlib installation root
#
# Output variables:
#     CPPNETLIB_INCLUDE_DIR - include directories
#     CPPNETLIB_LIBRARIES - libraries (client-connections, server-parsers, uri)
#     CPPNETLIB_FOUND - is 'YES' if library found

# Libraries variants:
#    CPPNETLIB_URI_LIBRARY
#    CPPNETLIB_URI_LIBRARY_DEBUG
#    CPPNETLIB_URI_LIBRARY_RELEASE
#    CPPNETLIB_CLIENT_CONNECTIONS_LIBRARY
#    CPPNETLIB_CLIENT_CONNECTIONS_LIBRARY_DEBUG
#    CPPNETLIB_CLIENT_CONNECTIONS_LIBRARY_RELEASE
#    CPPNETLIB_SERVER_PARSERS_LIBRARY
#    CPPNETLIB_SERVER_PARSERS_LIBRARY_DEBUG
#    CPPNETLIB_SERVER_PARSERS_LIBRARY_RELEASE

if(HUNTER_STATUS_DEBUG)
  message("[hunter] Custom FindCppNetlib module")
endif()

set(CPPNETLIB_FOUND YES)

find_path(
    CPPNETLIB_INCLUDE_DIR
    NAMES
    "boost/network.hpp"
    HINTS
    "${CPPNETLIB_ROOT}"
    ENV
    "CPPNETLIB_ROOT"
    PATH_SUFFIXES
    "include"
)

function(_find_cppnetlib_diagnostic_message pattern)
  if(CPPNETLIB_ROOT)
    message("CPPNETLIB_ROOT(cmake): ${CPPNETLIB_ROOT}")
  endif()
  if($ENV{CPPNETLIB_ROOT})
    message("CPPNETLIB_ROOT(env): $ENV{CPPNETLIB_ROOT}")
  endif()

  message(
      FATAL_ERROR
      "CppNetlib not found (pattern '${pattern}' not found)."
      "Please set CPPNETLIB_ROOT variable (cmake or environment)"
  )
endfunction()

if(NOT CPPNETLIB_INCLUDE_DIR)
  set(CPPNETLIB_FOUND NO)
  if(CppNetlib_FIND_REQUIRED)
    _find_cppnetlib_diagnostic_message("include/boost/network/hpp")
  endif()
endif()

foreach(lib uri client-connections server-parsers)
  string(TOUPPER "${lib}" _find_cppnetlib_upper)
  string(REPLACE "-" "_" _find_cppnetlib_upper "${_find_cppnetlib_upper}")
  set(_find_cppnetlib_upper "CPPNETLIB_${_find_cppnetlib_upper}_LIBRARY")
  set(
      _find_cppnetlib_upper_release
      "${_find_cppnetlib_upper}_RELEASE"
  )
  set(
      _find_cppnetlib_upper_debug
      "${_find_cppnetlib_upper}_DEBUG"
  )
  set(_find_cppnetlib_lower_release "cppnetlib-${lib}")
  set(_find_cppnetlib_lower_debug "cppnetlib-${lib}${CMAKE_DEBUG_POSTFIX}")

  find_library(
      ${_find_cppnetlib_upper_release}
      ${_find_cppnetlib_lower_release}
      HINTS
      "${CPPNETLIB_ROOT}"
      ENV
      "CPPNETLIB_ROOT"
      PATH_SUFFIXES
      "lib"
  )

  if(CMAKE_DEBUG_POSTFIX)
    find_library(
        ${_find_cppnetlib_upper_debug}
        ${_find_cppnetlib_lower_debug}
        HINTS
        "${CPPNETLIB_ROOT}"
        ENV
        "CPPNETLIB_ROOT"
        PATH_SUFFIXES
        "lib"
    )
  endif()

  if(${_find_cppnetlib_upper_debug} AND ${_find_cppnetlib_upper_release})
    set(
        ${_find_cppnetlib_upper}
        debug
        "${${_find_cppnetlib_upper_debug}}"
        optimized
        "${${_find_cppnetlib_upper_release}}"
    )
  elseif(${_find_cppnetlib_upper_release})
    set(${_find_cppnetlib_upper} "${${_find_cppnetlib_upper_release}}")
  else()
    set(CPPNETLIB_FOUND NO)
    if(CppNetlib_FIND_REQUIRED)
      _find_cppnetlib_diagnostic_message(
          "lib/...${_find_cppnetlib_lower_release}..."
      )
    endif()
  endif()

  if(${_find_cppnetlib_upper})
    list(APPEND CPPNETLIB_LIBRARIES ${${_find_cppnetlib_upper}})
  endif()
endforeach()
