# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_assert_not_empty_string)
include(hunter_internal_error)

set(_HUNTER_TEMPLATE_SCHEME_DIR "${CMAKE_CURRENT_LIST_DIR}/../templates")

function(hunter_inject_url_sha1_package)
  set(PACKAGE_NAME "${_hunter_current_project}")
  hunter_assert_not_empty_string("${PACKAGE_NAME}")

  set(optional "")
  set(one VERSION URL SHA1)
  set(multiple "")

  # Introduce:
  # * x_VERSION
  # * x_URL
  # * x_SHA1
  cmake_parse_arguments(x "${optional}" "${one}" "${multiple}" "${ARGV}")

  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_internal_error("Unparsed arguments: ${x_UNPARSED_ARGUMENTS}")
  endif()

  set(PACKAGE_SHA1 "${x_SHA1}")
  set(PACKAGE_URL "${x_URL}")

  hunter_assert_not_empty_string("${x_VERSION}")
  hunter_assert_not_empty_string("${PACKAGE_URL}")
  hunter_assert_not_empty_string("${PACKAGE_SHA1}")

  set(archives_directory "${CMAKE_CURRENT_BINARY_DIR}/_3rdParty/Hunter/git-archives")
  file(MAKE_DIRECTORY "${archives_directory}")

  set(version_file "${archives_directory}/${PACKAGE_NAME}-version.cmake")
  set(download_file "${archives_directory}/${PACKAGE_NAME}-download.cmake")

  # Use:
  # * PACKAGE_NAME
  configure_file(
      "${_HUNTER_TEMPLATE_SCHEME_DIR}/package-download.cmake.in"
      "${download_file}"
      @ONLY
  )

  # Use:
  # * PACKAGE_NAME
  # * PACKAGE_SHA1
  # * PACKAGE_URL
  configure_file(
      "${_HUNTER_TEMPLATE_SCHEME_DIR}/package-version.cmake.in"
      "${version_file}"
      @ONLY
  )

  # Note: SUBMODULE is not relevant in property name, just use same facility
  set_property(
      GLOBAL
      PROPERTY
      "HUNTER_${PACKAGE_NAME}_GIT_SUBMODULE_DIR"
      "${archives_directory}"
  )

  set_property(
      GLOBAL
      APPEND
      PROPERTY
      HUNTER_SUBMODULE_PROJECTS
      "${PACKAGE_NAME}"
  )

  set("${x_VERSION}" "${PACKAGE_SHA1}" PARENT_SCOPE)
endfunction()
