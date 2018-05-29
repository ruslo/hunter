# Copyright (c) 2013-2018, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_assert_empty_string)
include(hunter_assert_not_empty_string)
include(hunter_fatal_error)
include(hunter_pack_git_self)
include(hunter_pack_git_submodule)
include(hunter_parse_cmake_args_for_keyword)
include(hunter_user_error)

# Usage:
# * hunter_config(${package} GIT_SELF)
# * hunter_config(${package} GIT_SUBMODULE "...")
# * hunter_config(${package} VERSION "...")
# * hunter_config(${package} URL "..." SHA1 "...")

# All variants accepts extra:
# * KEEP_PACKAGE_SOURCES
# * VERSION
# * CMAKE_ARGS
# * CONFIGURATION_TYPES

function(hunter_config package)
  hunter_assert_not_empty_string("${package}")

  if(NOT __HUNTER_ALLOW_CONFIG_LOADING)
    hunter_fatal_error(
        "Unexpected 'hunter_config' usage from:"
        "  ${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE}"
        WIKI
        "error.unexpected.hunter_config"
    )
  endif()

  set(optional KEEP_PACKAGE_SOURCES GIT_SELF)
  set(one VERSION GIT_SUBMODULE URL SHA1)
  set(multiple CMAKE_ARGS CONFIGURATION_TYPES)

  # Introduce:
  # * x_KEEP_PACKAGE_SOURCES
  # * x_GIT_SELF
  # * x_VERSION
  # * x_GIT_SUBMODULE
  # * x_URL
  # * x_SHA1
  # * x_CMAKE_ARGS
  # * x_CONFIGURATION_TYPES
  cmake_parse_arguments(x "${optional}" "${one}" "${multiple}" "${ARGN}")

  hunter_assert_empty_string("${x_UNPARSED_ARGUMENTS}")

  if(x_GIT_SELF)
    if(NOT "${x_GIT_SUBMODULE}" STREQUAL "")
      hunter_user_error("GIT_SUBMODULE can't be used with GIT_SELF")
    endif()
    if(NOT "${x_URL}" STREQUAL "")
      hunter_user_error("URL can't be used with GIT_SELF")
    endif()
    if(NOT "${x_SHA1}" STREQUAL "")
      hunter_user_error("SHA1 can't be used with GIT_SELF")
    endif()
  elseif(NOT "${x_GIT_SUBMODULE}" STREQUAL "")
    if(NOT "${x_URL}" STREQUAL "")
      hunter_user_error("URL can't be used with GIT_SUBMODULE")
    endif()
    if(NOT "${x_SHA1}" STREQUAL "")
      hunter_user_error("SHA1 can't be used with GIT_SUBMODULE")
    endif()
  elseif(NOT "${x_URL}" STREQUAL "")
    if("${x_SHA1}" STREQUAL "")
      hunter_user_error("Expected SHA1")
    endif()
  elseif(NOT "${x_SHA1}" STREQUAL "")
    if("${x_URL}" STREQUAL "")
      hunter_user_error("Expected URL")
    endif()
  elseif("${x_VERSION}" STREQUAL "")
    hunter_user_error(
        "No VERSION, GIT_SELF, GIT_SUBMODULE or URL/SHA1 specified"
    )
  endif()

  if(NOT "${x_GIT_SUBMODULE}" STREQUAL "")
    # get HUNTER_SUBMODULE_SOURCE_SUBDIR from CMAKE_ARGS
    hunter_parse_cmake_args_for_keyword(
        CMAKE_ARGS ${x_CMAKE_ARGS}
        KEYWORD HUNTER_SUBMODULE_SOURCE_SUBDIR
        OUTPUT subdir
    )

    hunter_pack_git_submodule(
        PACKAGE "${package}"
        GIT_SUBMODULE "${x_GIT_SUBMODULE}"
        SUBMODULE_SOURCE_SUBDIR "${subdir}"
        URL_OUT x_URL
        SHA1_OUT x_SHA1
    )
  elseif(x_GIT_SELF)
    hunter_pack_git_self(
        PACKAGE "${package}"
        URL_OUT x_URL
        SHA1_OUT x_SHA1
    )
  endif()

  if("${x_VERSION}" STREQUAL "")
    # GIT_SELF, GIT_SUBMODULE or URL/SHA1 variant may not provide version.
    # Use SHA1 or packge in this case
    set(x_VERSION "${x_SHA1}")
  endif()

  hunter_assert_not_empty_string("${x_VERSION}")
  set("HUNTER_${package}_VERSION" "${x_VERSION}" PARENT_SCOPE)

  set(
      __HUNTER_USER_PACKAGES
      "${__HUNTER_USER_PACKAGES};${package}"
      PARENT_SCOPE
  )

  if(NOT "${x_SHA1}" STREQUAL "")
    set("__HUNTER_USER_SHA1_${package}" "${x_SHA1}" PARENT_SCOPE)
  endif()

  if(NOT "${x_CMAKE_ARGS}" STREQUAL "")
    set("__HUNTER_USER_CMAKE_ARGS_${package}" "${x_CMAKE_ARGS}" PARENT_SCOPE)
  endif()

  if(NOT "${x_CONFIGURATION_TYPES}" STREQUAL "")
    set(
        "__HUNTER_USER_CONFIGURATION_TYPES_${package}"
        "${x_CONFIGURATION_TYPES}"
        PARENT_SCOPE
    )
  endif()

  if(NOT "${x_URL}" STREQUAL "")
    set("__HUNTER_USER_URL_${package}" "${x_URL}" PARENT_SCOPE)
  endif()

  if(x_KEEP_PACKAGE_SOURCES)
    set("__HUNTER_USER_KEEP_PACKAGE_SOURCES_${package}" "TRUE" PARENT_SCOPE)
  endif()
endfunction()
