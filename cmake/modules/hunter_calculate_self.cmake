# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(hunter_internal_error)
include(hunter_test_string_not_empty)

function(hunter_calculate_self root version sha1 result)
  hunter_test_string_not_empty("${root}")
  hunter_test_string_not_empty("${version}")
  hunter_test_string_not_empty("${sha1}")
  hunter_test_string_not_empty("${result}")

  string(SUBSTRING "${sha1}" 0 7 archive_id)

  if(EXISTS "${root}/cmake/Hunter")
    set(hunter_self "${root}")
  else()
    set(
        hunter_self
        "${root}/_Base/Download/Hunter/${version}/${archive_id}/Unpacked"
    )
  endif()

  set("${result}" "${hunter_self}" PARENT_SCOPE)
endfunction()
