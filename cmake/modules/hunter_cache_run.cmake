# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_add_package)
include(hunter_internal_error)
include(hunter_assert_not_empty_string)

# Do not install any packages.
# Check cache and load cache.sha1 to home directory on hit.
function(hunter_cache_run)
  set(one PACKAGE COMPONENT)
  cmake_parse_arguments(x "" "${one}" "" "${ARGV}")
  # -> x_PACKAGE
  # -> x_COMPONENT

  hunter_assert_not_empty_string("${x_PACKAGE}")

  string(COMPARE NOTEQUAL "${x_COMPONENT}" "" has_component)
  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_internal_error("Unparsed: ${x_UNPARSED_ARGUMENTS}")
  endif()

  set(HUNTER_CACHE_RUN TRUE)

  if(has_component)
    hunter_status_debug("Try load package ${x_PACKAGE} (comp. ${x_COMPONENT})")
    hunter_add_package(${x_PACKAGE} COMPONENTS ${x_COMPONENT})
  else()
    hunter_status_debug("Try load package ${x_PACKAGE}")
    hunter_add_package(${x_PACKAGE})
  endif()
endfunction()
