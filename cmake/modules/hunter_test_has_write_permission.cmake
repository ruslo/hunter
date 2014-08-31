# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(hunter_fatal_error)
include(hunter_test_string_not_empty)

function(hunter_test_has_write_permission)
  hunter_test_string_not_empty("${HUNTER_BASE}")

  string(RANDOM LENGTH 10 rand)
  set(test_path "${HUNTER_BASE}/permissions_test/${rand}")

  file(MAKE_DIRECTORY "${test_path}")
  if(NOT EXISTS "${test_path}")
    hunter_fatal_error(
         "Directory creation failed (${test_path})"
         "May be permission denied (?)"
         "Check free HDD space also"
         WIKI "https://github.com/ruslo/hunter/wiki/Error-%28directory-creation-failed%29"
    )
  endif()
endfunction()
