# Copyright (c) 2013, 2015 Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_fatal_error)
include(hunter_finalize)
include(hunter_get_project_files_to_load)
include(hunter_internal_error)
include(hunter_status_debug)

# internal variables: _hunter_ap_*
macro(hunter_add_package)
  string(COMPARE EQUAL "${PROJECT_NAME}" "" _project_name_is_empty)
  if(_project_name_is_empty)
    hunter_fatal_error(
        "Please set hunter_add_package *after* project command"
        ERROR_PAGE "error.hunteraddpackage.after.project"
    )
  endif()

  if(NOT HUNTER_FINALIZED)
    hunter_finalize()
    set(HUNTER_FINALIZED TRUE)
  endif()

  cmake_parse_arguments(_hunter_ap_arg "" "" COMPONENTS ${ARGV})

  # Get project name
  list(LENGTH _hunter_ap_arg_UNPARSED_ARGUMENTS _hunter_ap_len)
  if(NOT ${_hunter_ap_len} EQUAL 1)
    hunter_internal_error(
        "'hunter_add_package' incorrect usage,"
        " expected one argument before COMPONENTS"
    )
  endif()
  list(GET _hunter_ap_arg_UNPARSED_ARGUMENTS 0 _hunter_ap_project)

  hunter_get_project_files_to_load(
      PROJECT_NAME "${_hunter_ap_project}"
      COMPONENTS "${_hunter_ap_arg_COMPONENTS}"
      FILES _hunter_ap_list
      NEW_INJECTED_PACKAGE _hunter_ap_new_injected_package
  )

  if(_hunter_ap_new_injected_package)
    hunter_status_debug("Injected package '${_hunter_ap_project}'")
    include(hunter_cacheable)
    include(hunter_download)
    include(hunter_pick_scheme)
    hunter_pick_scheme(DEFAULT url_sha1_cmake)
    hunter_cacheable("${_hunter_ap_project}")
    hunter_download(PACKAGE_NAME "${_hunter_ap_project}")
  else()
    # do not use any variables after this 'foreach', because included files
    # may call 'hunter_add_package' and rewrite it
    foreach(x ${_hunter_ap_list})
      hunter_status_debug("load: ${x}")
      if(NOT EXISTS "${x}")
        hunter_internal_error("File not found: '${x}'")
      endif()
      include("${x}")
      hunter_status_debug("load: ${x} ... end")
    endforeach()
  endif()
endmacro()
