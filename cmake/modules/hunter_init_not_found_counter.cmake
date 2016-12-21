# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

function(hunter_init_not_found_counter not_found_needed_name not_found_counter_name number_of_servers)
  string(COMPARE EQUAL "${HUNTER_USE_CACHE_SERVERS}" "ONLY" only_servers)
  if(only_servers)
    set(x 4)
  else()
    set(x 2)
  endif()
  math(EXPR x "${x} * ${number_of_servers}")
  set("${not_found_needed_name}" "${x}" PARENT_SCOPE)
  set("${not_found_counter_name}" 0 PARENT_SCOPE)
endfunction()
