# Copyright (c) 2014-2015, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_internal_error)
include(hunter_test_string_not_empty)

# Set variables:
#     * HUNTER_DOWNLOAD_SCHEME
#     * HUNTER_DOWNLOAD_SCHEME_INSTALL
function(hunter_pick_scheme)
  hunter_test_string_not_empty("${CMAKE_GENERATOR}")

  # Note: MSVC_IDE is empty before "project" command
  set(is_combined NO)
  string(COMPARE EQUAL "${CMAKE_GENERATOR}" "Xcode" is_xcode)
  if(is_xcode)
    set(is_combined YES)
  else()
    string(FIND "${CMAKE_GENERATOR}" "Visual Studio" result)
    if(NOT result EQUAL "-1")
      set(is_combined YES)
    endif()
  endif()

  # parse args
  set(one DEFAULT COMBINED IPHONEOS WINDOWS)

  cmake_parse_arguments(x "" "${one}" "" ${ARGV})
  if(x_UNPARSED_ARGUMENTS)
    hunter_internal_error("hunter_pick_scheme unparsed: ${x_UNPARSED_ARGUMENTS}")
  endif()

  string(COMPARE EQUAL "${CMAKE_OSX_SYSROOT}" "iphoneos" is_iphoneos)

  # set HUNTER_DOWNLOAD_SCHEME
  if(is_iphoneos AND x_IPHONEOS)
    set(HUNTER_DOWNLOAD_SCHEME "${x_IPHONEOS}")
  elseif(WIN32 AND x_WINDOWS)
    set(HUNTER_DOWNLOAD_SCHEME "${x_WINDOWS}")
  elseif(is_combined AND x_COMBINED)
    set(HUNTER_DOWNLOAD_SCHEME "${x_COMBINED}")
  elseif(x_DEFAULT)
    set(HUNTER_DOWNLOAD_SCHEME "${x_DEFAULT}")
  else()
    hunter_internal_error("hunter_pick_scheme: expected DEFAULT")
  endif()

  # set HUNTER_DOWNLOAD_SCHEME_INSTALL
  string(
      COMPARE
      NOTEQUAL
      "${HUNTER_DOWNLOAD_SCHEME}"
      "url_sha1_no_install"
      HUNTER_DOWNLOAD_SCHEME_INSTALL
  )

  # Forward to parent scope
  set(HUNTER_DOWNLOAD_SCHEME "${HUNTER_DOWNLOAD_SCHEME}" PARENT_SCOPE)
  set(
      HUNTER_DOWNLOAD_SCHEME_INSTALL
      "${HUNTER_DOWNLOAD_SCHEME_INSTALL}"
      PARENT_SCOPE
  )
endfunction()
