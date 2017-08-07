# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_test_string_not_empty)

# We must use macro to set variable to parent scope of the caller.
#
# In:
# * HUNTER_PACKAGE_HOME_DIR
# * HUNTER_PACKAGE_LICENSE_SEARCH_DIR
# * HUNTER_PACKAGE_NAME
# * HUNTER_PACKAGE_SCHEME_UNPACK
# * HUNTER_PACKAGE_SHA1
# Out:
# * ${HUNTER_PACKAGE_NAME}_LICENSES (parent scope)
macro(hunter_find_licenses)
  hunter_test_string_not_empty("${HUNTER_PACKAGE_LICENSE_SEARCH_DIR}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_NAME}")

  file(GLOB _licenses "${HUNTER_PACKAGE_LICENSE_SEARCH_DIR}/*")

  set("${HUNTER_PACKAGE_NAME}_LICENSES" "${_licenses}" PARENT_SCOPE)

  # HACK (to refactor) {
  if(HUNTER_PACKAGE_SCHEME_UNPACK)
    hunter_test_string_not_empty("${HUNTER_PACKAGE_HOME_DIR}")
    hunter_test_string_not_empty("${HUNTER_PACKAGE_SHA1}")
    file(
        WRITE
        "${HUNTER_PACKAGE_HOME_DIR}/cache.sha1"
        "${HUNTER_PACKAGE_SHA1}"
    )
  endif()
  # }
endmacro()

# vim:set shiftwidth=2 tabstop=2 softtabstop=2 expandtab:
