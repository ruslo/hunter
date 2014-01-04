# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_fatal_error)
include(hunter_test_string_not_empty)
include(hunter_unsetvar)

# Set variables:
#     * HUNTER_DOWNLOAD_SCHEME
#     * HUNTER_DOWNLOAD_SCHEME_INSTALL
#     * HUNTER_DOWNLOAD_SCHEME_VARIANTS
function(hunter_pick_scheme)
  # check preconditions
  hunter_test_string_not_empty("${HUNTER_BASE}")
  hunter_test_string_not_empty("${HUNTER_INSTALL_TAG}")

  # default generator (see function `hunter_set_cmake_default_generator`)
  set(
      generator_info
      "${HUNTER_BASE}/Toolchains/${HUNTER_INSTALL_TAG}/default_generator.info"
  )
  if(NOT EXISTS "${generator_info}")
    hunter_fatal_error("File `${generator_info}` not found")
  endif()

  file(READ "${generator_info}" default_generator)

  hunter_unsetvar(is_combined)
  string(COMPARE EQUAL "${default_generator}" "Xcode" is_xcode)
  if(is_xcode)
    set(is_combined YES)
  else()
    string(FIND "${default_generator}" "Visual Studio" result)
    if(NOT result EQUAL "-1")
      set(is_combined YES)
    endif()
  endif()

  # parse args
  set(one DEFAULT COMBINED IPHONEOS WINDOWS)

  cmake_parse_arguments(x "" "${one}" "" ${ARGV})
  if(x_UNPARSED_ARGUMENTS)
    hunter_fatal_error("hunter_pick_scheme unparsed: ${x_UNPARSED_ARGUMENTS}")
  endif()

  string(COMPARE EQUAL "${CMAKE_OSX_SYSROOT}" "iphoneos" is_iphoneos)

  # set HUNTER_DOWNLOAD_SCHEME
  if(is_iphoneos AND x_IPHONEOS)
    set(HUNTER_DOWNLOAD_SCHEME "${x_IPHONEOS}")
  if(WIN32 AND x_WINDOWS)
    set(HUNTER_DOWNLOAD_SCHEME "${x_WINDOWS}")
  elseif(is_combined AND x_COMBINED)
    set(HUNTER_DOWNLOAD_SCHEME "${x_COMBINED}")
  elseif(x_DEFAULT)
    set(HUNTER_DOWNLOAD_SCHEME "${x_DEFAULT}")
  else()
    hunter_fatal_error("hunter_pick_scheme: expected DEFAULT")
  endif()

  # set HUNTER_DOWNLOAD_SCHEME_INSTALL
  string(
      COMPARE
      NOTEQUAL
      "${HUNTER_DOWNLOAD_SCHEME}"
      "url_sha1_no_install"
      HUNTER_DOWNLOAD_SCHEME_INSTALL
  )

  # set HUNTER_DOWNLOAD_SCHEME_VARIANTS
  hunter_unsetvar(HUNTER_DOWNLOAD_SCHEME_VARIANTS)
  string(
      COMPARE
      EQUAL
      "${HUNTER_DOWNLOAD_SCHEME}"
      "url_sha1_boost_ios_library"
      is_ios
  )
  if(is_ios)
    set(HUNTER_DOWNLOAD_SCHEME_VARIANTS ios ios_sim ios_universal)
  endif()

  string(
      COMPARE
      EQUAL
      "${HUNTER_DOWNLOAD_SCHEME}"
      "url_sha1_release_debug"
      is_release_debug
  )
  if(is_release_debug)
    set(HUNTER_DOWNLOAD_SCHEME_VARIANTS release debug)
  endif()

  string(
      COMPARE
      EQUAL
      "${HUNTER_DOWNLOAD_SCHEME}"
      "url_sha1_openssl_ios"
      is_openssl_ios
  )
  if(is_openssl_ios)
    set(
        HUNTER_DOWNLOAD_SCHEME_VARIANTS
        ${IPHONEOS_ARCHS}
        ${IPHONESIMULATOR_ARCHS}
        ios_universal
    )
  endif()

  # Forward to parent scope
  set(HUNTER_DOWNLOAD_SCHEME "${HUNTER_DOWNLOAD_SCHEME}" PARENT_SCOPE)
  set(
      HUNTER_DOWNLOAD_SCHEME_INSTALL
      "${HUNTER_DOWNLOAD_SCHEME_INSTALL}"
      PARENT_SCOPE
  )
  set(
      HUNTER_DOWNLOAD_SCHEME_VARIANTS
      "${HUNTER_DOWNLOAD_SCHEME_VARIANTS}"
      PARENT_SCOPE
  )
endfunction()
