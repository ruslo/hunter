# Copyright (c) 2017 NeroBurner
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_assert_not_empty_string)

# check if component is in specified version range, add to 'varname' if valid
# - varname:       name of the variable of the list to append component names
# - name:          name of the component to add to list if version is valid
# - given_version: version to check
# - version_since: first version the component is included
# - version_until: first version the component isn't included anymore
function(hunter_append_component)
  set(function_name "hunter_append_component")
  set(function_synopsis "${function_name}(LIST varname VERSION given-version COMPONENT name SINCE version_since [UNTIL version_until])")

  # parse arguments
  set(one_value_args LIST VERSION COMPONENT SINCE UNTIL)
  cmake_parse_arguments(x "" "${one_value_args}" "" ${ARGV})

  # No free arguments allowed
  list(LENGTH x_UNPARSED_ARGUMENTS x_len)
  if(NOT x_len EQUAL 0)
    hunter_internal_error(
      "'${function_name}' incorrect usage,"
      " expected no free arguments '${x_UNPARSED_ARGUMENTS}'."
      " Synopsis: ${function_synopsis}"
    )
  endif()

  # check mandatory arguments
  foreach(arg LIST VERSION COMPONENT SINCE)
    string(COMPARE EQUAL "${x_${arg}}" "" is_empty)
    if(is_empty)
      hunter_internal_error(
        "'${function_name}' incorrect usage,"
        " option '${arg}' with one argument is mandatory."
        " Synopsis: ${function_synopsis}"
      )
    endif()
  endforeach()

  set(component_list ${${x_LIST}})
  if(NOT x_VERSION VERSION_LESS x_SINCE)
    # check until only if set
    string(COMPARE EQUAL "${x_UNTIL}" "" _is_empty)
    if(_is_empty)
      list(APPEND component_list ${x_COMPONENT})
    elseif(x_VERSION VERSION_LESS x_UNTIL)
      list(APPEND component_list ${x_COMPONENT})
    endif()
  endif()

  # set output_var to found definition
  set(${x_LIST} ${component_list} PARENT_SCOPE)
endfunction()
