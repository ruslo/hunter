# Copyright (c) 2014-2015, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_internal_error)
include(hunter_assert_not_empty_string)

# Set variable:
#     * HUNTER_DOWNLOAD_SCHEME
# Set one of the variables:
#     * HUNTER_PACKAGE_SCHEME_DOWNLOAD
#     * HUNTER_PACKAGE_SCHEME_UNPACK
#     * HUNTER_PACKAGE_SCHEME_INSTALL
function(hunter_pick_scheme)
  hunter_assert_not_empty_string("${CMAKE_GENERATOR}")

  # parse args
  set(one DEFAULT IPHONEOS WINDOWS)

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
  elseif(x_DEFAULT)
    set(HUNTER_DOWNLOAD_SCHEME "${x_DEFAULT}")
  else()
    hunter_internal_error("hunter_pick_scheme: expected DEFAULT")
  endif()

  set(HUNTER_PACKAGE_SCHEME_DOWNLOAD "")
  set(HUNTER_PACKAGE_SCHEME_UNPACK "")
  set(HUNTER_PACKAGE_SCHEME_UNPACK_INSTALL "")
  set(HUNTER_PACKAGE_SCHEME_INSTALL "")

  # set HUNTER_PACKAGE_SCHEME_*
  string(
      COMPARE
      EQUAL
      "${HUNTER_DOWNLOAD_SCHEME}"
      "url_sha1_unpack"
      is_unpack
  )

  string(
      COMPARE
      EQUAL
      "${HUNTER_DOWNLOAD_SCHEME}"
      "url_sha1_download"
      is_download
  )

  string(
      COMPARE
      EQUAL
      "${HUNTER_DOWNLOAD_SCHEME}"
      "url_sha1_unpack_install"
      is_unpack_install
  )

  string(
      COMPARE
      EQUAL
      "${HUNTER_DOWNLOAD_SCHEME}"
      "url_sha1_unpack_bin_install"
      is_unpack_bin_install
  )

  if(is_unpack)
    set(HUNTER_PACKAGE_SCHEME_UNPACK "1")
  elseif(is_download)
    set(HUNTER_PACKAGE_SCHEME_DOWNLOAD "1")
  elseif(is_unpack_install OR is_unpack_bin_install)
    set(HUNTER_PACKAGE_SCHEME_UNPACK_INSTALL "1")
  else()
    set(HUNTER_PACKAGE_SCHEME_INSTALL "1")
  endif()

  # Forward to parent scope
  set(HUNTER_DOWNLOAD_SCHEME "${HUNTER_DOWNLOAD_SCHEME}" PARENT_SCOPE)

  set(
      HUNTER_PACKAGE_SCHEME_DOWNLOAD
      "${HUNTER_PACKAGE_SCHEME_DOWNLOAD}"
      PARENT_SCOPE
  )
  set(
      HUNTER_PACKAGE_SCHEME_UNPACK
      "${HUNTER_PACKAGE_SCHEME_UNPACK}"
      PARENT_SCOPE
  )
  set(
      HUNTER_PACKAGE_SCHEME_UNPACK_INSTALL
      "${HUNTER_PACKAGE_SCHEME_UNPACK_INSTALL}"
      PARENT_SCOPE
  )
  set(
      HUNTER_PACKAGE_SCHEME_INSTALL
      "${HUNTER_PACKAGE_SCHEME_INSTALL}"
      PARENT_SCOPE
  )
endfunction()
