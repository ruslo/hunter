# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

include(hunter_internal_error)

function(hunter_assert_lists_equal)
  list(LENGTH ARGV list_len)
  math(EXPR list_uneven "(${list_len}) % 2")
  if(list_uneven EQUAL 1)
    hunter_internal_error("Uneven number of items")
  endif()
  if(list_len EQUAL 0)
    return()
  endif()
  math(EXPR list_half "(${list_len}) / 2")
  math(EXPR index_max "(${list_half}) - 1")
  foreach(loop_var RANGE ${index_max})
    set(index_a ${loop_var})
    math(EXPR index_b "(${loop_var}) + (${list_half})")
    list(GET ARGV ${index_a} value_a)
    list(GET ARGV ${index_b} value_b)
    string(COMPARE EQUAL "${value_a}" "${value_b}" result)
    if(NOT result)
      hunter_internal_error(
          "Lists are not equal:"
          "at index: ${index_a} ${index_b}"
          "values: ${value_a} ${value_b}"
      )
    endif()
  endforeach()
endfunction()
