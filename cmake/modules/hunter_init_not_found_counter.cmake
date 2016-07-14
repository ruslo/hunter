# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

function(hunter_init_not_found_counter not_found_needed_name not_found_counter_name)
  string(COMPARE EQUAL "${HUNTER_USE_CACHE_SERVERS}" "ONLY" only_servers)
  if(only_servers)
    set("${not_found_needed_name}" 4 PARENT_SCOPE)
  else()
    set("${not_found_needed_name}" 2 PARENT_SCOPE)
  endif()
  set("${not_found_counter_name}" 0 PARENT_SCOPE)
endfunction()
