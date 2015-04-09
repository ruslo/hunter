# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(hunter_fatal_error)
include(hunter_status_debug)
include(hunter_test_string_not_empty)

macro(hunter_lock_directory dir)
  hunter_test_string_not_empty("${dir}")

  if(NOT HUNTER_SKIP_LOCK)
    if("${CMAKE_VERSION}" VERSION_LESS "3.2")
      hunter_fatal_error(
          "Can't lock, upgrade to CMake 3.2 or use HUNTER_SKIP_LOCK"
          WIKI "error.can.not.lock"
      )
    endif()
    hunter_status_debug("Locking directory: ${dir}")
    file(LOCK "${dir}" DIRECTORY GUARD FUNCTION)
    hunter_status_debug("Lock done")
  endif()
endmacro()
