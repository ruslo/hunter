# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(hunter_fatal_error)
include(hunter_status_debug)
include(hunter_assert_not_empty_string)

macro(hunter_lock_directory dir already_locked_varname)
  hunter_assert_not_empty_string("${dir}")

  set(_hunter_already_locked FALSE)
  foreach(_hunter_locked_dir ${${already_locked_varname}})
    hunter_status_debug("Already locked: ${_hunter_locked_dir}")
    string(COMPARE EQUAL "${_hunter_locked_dir}" "${dir}" _is_locked)
    if(_is_locked)
      set(_hunter_already_locked TRUE)
    endif()
  endforeach()
  if(_hunter_already_locked)
    hunter_status_debug("Skip locking for: ${dir}")
  else()
    hunter_status_debug("Locking directory: ${dir}")
    file(LOCK "${dir}" DIRECTORY GUARD FUNCTION)
    hunter_status_debug("Lock done")
    list(APPEND ${already_locked_varname} "${dir}")
  endif()
endmacro()
