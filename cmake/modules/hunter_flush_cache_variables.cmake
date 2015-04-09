# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(hunter_test_string_not_empty)

function(hunter_flush_cache_variables hunter_self)
  hunter_test_string_not_empty("${hunter_self}")

  set(directory_with_projects "${hunter_self}/cmake/projects")
  file(
      GLOB projects
      RELATIVE "${directory_with_projects}"
      "${directory_with_projects}/*"
  )

  if(NOT projects)
    message(FATAL_ERROR "No projects found")
  endif()

  set(real_projects "")
  foreach(x ${projects})
    if(IS_DIRECTORY "${directory_with_projects}/${x}")
      list(APPEND real_projects "${x}")
    endif()
  endforeach()

  if(NOT real_projects)
    message(FATAL_ERROR "No projects found")
  endif()

  foreach(x ${real_projects})
    unset("${x}_ROOT" CACHE)
    unset("${x}_Dir" CACHE)
  endforeach()
endfunction()
