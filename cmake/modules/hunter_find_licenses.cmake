# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_test_string_not_empty)

# We must use macro to set variable to parent scope of the caller.
#
# In:
# * HUNTER_INSTALL_PREFIX
# * HUNTER_PACKAGE_NAME
# Out:
# * ${HUNTER_PACKAGE_NAME}_LICENSES (parent scope)
macro(hunter_find_licenses)
  hunter_test_string_not_empty("${HUNTER_INSTALL_PREFIX}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_NAME}")

  file(
      GLOB
      _licenses
      "${HUNTER_INSTALL_PREFIX}/licenses/${HUNTER_PACKAGE_NAME}/*"
  )

  set("${HUNTER_PACKAGE_NAME}_LICENSES" "${_licenses}" PARENT_SCOPE)
endmacro()
