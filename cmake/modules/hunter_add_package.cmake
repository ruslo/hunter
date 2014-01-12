# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_fatal_error)
include(hunter_status_debug)

# internal variables: _hunter_ap_*
macro(hunter_add_package)
  cmake_parse_arguments(_hunter_ap_arg "" "" COMPONENTS ${ARGV})

  # Get project name
  list(LENGTH _hunter_ap_arg_UNPARSED_ARGUMENTS _hunter_ap_len)
  if(NOT ${_hunter_ap_len} EQUAL 1)
    hunter_fatal_error(
        "'hunter_add_package' incorrect usage,"
        " expected one argument before COMPONENTS"
    )
  endif()
  list(GET _hunter_ap_arg_UNPARSED_ARGUMENTS 0 _hunter_ap_project)

  set(
      _hunter_ap_project_dir
      "${HUNTER_ROOT}/Source/cmake/projects/${_hunter_ap_project}"
  )
  if(NOT EXISTS "${_hunter_ap_project_dir}")
    hunter_fatal_error("Project '${_hunter_ap_project}' not found")
  endif()
  if(NOT IS_DIRECTORY "${_hunter_ap_project_dir}")
    hunter_fatal_error("Project '${_hunter_ap_project}' not found")
  endif()

  # Check components
  foreach(_hunter_ap_component ${_hunter_ap_arg_COMPONENTS})
    set(
        _hunter_ap_component_dir
        "${_hunter_ap_project_dir}/${_hunter_ap_component}"
    )
    if(NOT EXISTS "${_hunter_ap_component_dir}")
      hunter_fatal_error(
          "Component '${_hunter_ap_component}' not found "
          "in project '${_hunter_ap_project}'"
      )
    endif()
    if(NOT IS_DIRECTORY "${_hunter_ap_component_dir}")
      hunter_fatal_error(
          "Component '${_hunter_ap_component}' not found "
          "in project '${_hunter_ap_project}'"
      )
    endif()
  endforeach()

  unset(_hunter_ap_list)
  list(APPEND _hunter_ap_list "${_hunter_ap_project_dir}/hunter.cmake")

  # Load components
  foreach(_hunter_ap_component ${_hunter_ap_arg_COMPONENTS})
    list(
        APPEND
        _hunter_ap_list
        "${_hunter_ap_project_dir}/${_hunter_ap_component}/hunter.cmake"
    )
  endforeach()

  if(HUNTER_ENABLED)
    # do not use any variables after this 'foreach', because included files
    # may call 'hunter_add_package' and rewrite it
    foreach(x ${_hunter_ap_list})
      hunter_status_debug("load: ${x}")
      include("${x}")
      hunter_status_debug("load: ${x} ... end")
    endforeach()
  endif()
endmacro()
