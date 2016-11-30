# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_internal_error)

function(hunter_qt_add_module)
  set(one "NAME")
  set(multiple "COMPONENTS")

  cmake_parse_arguments(x "" "${one}" "${multiple}" ${ARGV})
  # -> x_NAME
  # -> x_COMPONENTS

  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_internal_error("Unparsed: ${x_UNPARSED_ARGUMENTS}")
  endif()

  string(COMPARE EQUAL "${x_NAME}" "" no_name)
  if(no_name)
    # Platforms may not support some component and hence name will be empty
    return()
  endif()

  set(dep_list "${x_COMPONENTS}")

  foreach(dep ${dep_list})
    list(APPEND dep_list ${component_${dep}_depends_on})
  endforeach()

  list(REMOVE_ITEM dep_list "") # remove empty elements
  list(REMOVE_DUPLICATES dep_list)
  list(SORT dep_list)

  set(component_${x_NAME}_depends_on "${dep_list}" PARENT_SCOPE)
endfunction()
