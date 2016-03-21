# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_get_package_deps)
include(hunter_internal_error)
include(hunter_test_string_not_empty)

# Get list of dependencies sorted alphabetically in format:
#   <package> <component>
#   <package>
#
# Note: this function will save all dependencies, i.e. in case
# when A depends on B and C, and B depends on D, it will return B + C + D
# (see also hunter_get_package_deps). All dependencies needed to save final
# information in cache. So we can unpack current cached archive only
# if all cached dependencies SHA1 matches.
function(hunter_get_package_deps_recurse)
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

  set(basic_dependencies "")

  if(has_component)
    hunter_get_package_deps(
        PACKAGE "${x_PACKAGE}"
        COMPONENT "${x_COMPONENT}"
        RESULT basic_dependencies
    )
  else()
    hunter_get_package_deps(PACKAGE "${x_PACKAGE}" RESULT basic_dependencies)
  endif()

  set(secondary_dependencies "")

  foreach(dep ${basic_dependencies})
    string(REPLACE " " ";" dep "${dep}")
    list(LENGTH dep dep_len)
    if(dep_len EQUAL 1)
      # format: <package>
      hunter_get_package_deps_recurse(PACKAGE "${dep}" RESULT result)
    elseif(dep_len EQUAL 2)
      # format: <package> <component> 
      list(GET dep 0 package)
      list(GET dep 1 component)
      hunter_get_package_deps_recurse(
          PACKAGE "${package}" COMPONENT "${component}" RESULT result
      )
    else()
      hunter_internal_error("Invalid format")
    endif()
    list(APPEND secondary_dependencies "${result}")
  endforeach()

  set(all_dependencies "${secondary_dependencies};${basic_dependencies}")

  list(REMOVE_DUPLICATES all_dependencies)
  list(REMOVE_ITEM all_dependencies "")

  list(SORT all_dependencies)
  set("${x_RESULT}" "${all_dependencies}" PARENT_SCOPE)
endfunction()
