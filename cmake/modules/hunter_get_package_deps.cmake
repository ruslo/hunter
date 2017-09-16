# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_internal_error)
include(hunter_test_string_not_empty)

# Get list of dependencies sorted alphabetically in format:
#   <package> <component>
#   <package>
#
# Note: this function will only save non-recurse dependencies, i.e. in case
# when A depends on B and C, and B depends on D, it will return B + C
# (see also hunter_get_package_deps_recurse). Non-recurse dependencies
# useful in cache. It shows the fact that when we have only information about
# toolchain and build options of one package we can only be sure about first
# level dependencies (i.e. A always depends on B and C if toolchain and CMake
# options of A build are the same) but we can't be sure about further
# dependencies since options for B build may be not the same (i.e. B may not
# depends on D or have more dependencies E and F with different CMake build
# options).
function(hunter_get_package_deps)
  set(one PACKAGE COMPONENT RESULT)
  cmake_parse_arguments(x "" "${one}" "" "${ARGV}")
  # x_PACKAGE package need to be processed (IN)
  # x_COMPONENT optional component (IN)
  # x_RESULT list of packages (OUT)

  string(COMPARE NOTEQUAL "${x_COMPONENT}" "" has_component)
  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_internal_error("Unparsed: ${x_UNPARSED_ARGUMENTS}")
  endif()

  hunter_test_string_not_empty("${x_PACKAGE}")
  hunter_test_string_not_empty("${x_RESULT}")

  hunter_test_string_not_empty("${HUNTER_CONFIG_ID_PATH}")

  # Go to directory '<toolchain-id>/Build/<package>/__<component>/Dependencies'
  # and find all `__dep` files.
  set(dep_dir "${HUNTER_CONFIG_ID_PATH}/Build/${x_PACKAGE}")
  if(has_component)
    set(dep_dir "${dep_dir}/__${x_COMPONENT}")
  endif()
  if(NOT EXISTS "${dep_dir}")
    hunter_internal_error("Directory not found: ${dep_dir}")
  endif()
  set(dep_dir "${dep_dir}/Dependencies")

  set(dependencies "")

  file(GLOB_RECURSE dep_file_list RELATIVE "${dep_dir}" "${dep_dir}/*/__dep")
  foreach(curr_dep_file ${dep_file_list})
    get_filename_component(curr_dep_dir "${curr_dep_file}" DIRECTORY)
    string(REPLACE "/" " " entry "${curr_dep_dir}")
    list(APPEND dependencies "${entry}")
  endforeach()

  list(SORT dependencies)
  set("${x_RESULT}" "${dependencies}" PARENT_SCOPE)
endfunction()
