# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_fatal_error)
include(hunter_find_stamps)
include(hunter_test_string_not_empty)

# Optimization:
#     Check run needed. If 'Stamp/<name-...>/<name-...>-install' file
#     detected, no need to generate/run project
function(hunter_check_already_installed)
  hunter_test_string_not_empty("${HUNTER_PACKAGE_BASENAME}")
  hunter_test_string_not_empty("${HUNTER_BASE}")

  set(one RESULT)
  set(multi VARIANTS)

  cmake_parse_arguments(x "" "${one}" "${multi}" ${ARGV})
  # -> x_RESULT
  # -> x_VARIANTS

  if(x_UNPARSED_ARGUMENTS)
    hunter_fatal_error("Unparsed: ${x_UNPARSED_ARGUMENTS}")
  endif()

  # Use: HUNTER_PACKAGE_BASENAME and HUNTER_BASE
  hunter_find_stamps(
      NAME "install"
      VARIANTS ${x_VARIANTS}
      RESULT install_list_stamps
  )

  list(LENGTH install_list_stamps result_number)
  list(LENGTH x_VARIANTS variants_number)
  if(variants_number EQUAL 0)
    set(variants_number 1)
  endif()
  if(result_number EQUAL variants_number)
    # Do skip (already installed)
    set(${x_RESULT} YES PARENT_SCOPE)
  else()
    set(${x_RESULT} NO PARENT_SCOPE)
  endif()
endfunction()
