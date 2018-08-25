# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(hunter_internal_error)
include(hunter_assert_not_empty_string)

function(hunter_calculate_self root version sha1 result)
  hunter_assert_not_empty_string("${root}")
  hunter_assert_not_empty_string("${version}")
  hunter_assert_not_empty_string("${sha1}")
  hunter_assert_not_empty_string("${result}")

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
