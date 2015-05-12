# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_add_package)
include(hunter_internal_error)
include(hunter_test_string_not_empty)

# Do not install any packages.
# Check cache and load cache.sha1 to home directory on hit.
function(hunter_cache_run)
  set(one PACKAGE COMPONENT)
  cmake_parse_arguments(x "" "${one}" "" "${ARGV}")
  # -> x_PACKAGE
  # -> x_COMPONENT

  hunter_test_string_not_empty("${x_PACKAGE}")

  string(COMPARE NOTEQUAL "${x_COMPONENT}" "" has_component)
  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_internal_error("Unparsed: ${x_UNPARSED_ARGUMENTS}")
  endif()

  if(HUNTER_CACHE_RUN)
    return()
  endif()

  set(HUNTER_CACHE_RUN TRUE)
  set(HUNTER_PARENT_PACKAGE "") # Avoid dependency registration

  if(has_component)
    hunter_add_package(${x_PACKAGE})
  else()
    hunter_add_package(${x_PACKAGE} COMPONENTS ${x_COMPONENT})
  endif()
endfunction()
