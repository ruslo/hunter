# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(hunter_status_debug)
include(hunter_test_string_not_empty)
include(hunter_unsetvar)

function(hunter_flush_cache_variables hunter_self)
  hunter_test_string_not_empty("${hunter_self}")

  hunter_status_debug("Flushing cache")

  # Read list of all cache variables and unset '*_{ROOT|Dir|DIR}' {
  get_directory_property(cache_list CACHE_VARIABLES)

  foreach(x ${cache_list})
    set(cleanup FALSE)
    if(x MATCHES "^.*_ROOT$")
      set(cleanup TRUE)
    endif()
    if(x MATCHES "^.*_DIR$")
      set(cleanup TRUE)
    endif()
    if(x MATCHES "^.*_Dir$")
      set(cleanup TRUE)
    endif()

    # Issue https://github.com/ruslo/hunter/issues/569 {
    if(x MATCHES "^Boost_.*_LIBRARY_.*$")
      set(cleanup TRUE)
    endif()

    if(x MATCHES "^Boost_LIBRARY_DIR_.*$")
      set(cleanup TRUE)
    endif()

    if(x MATCHES "^_Boost_LIBRARY_DIR_.*_LAST$")
      set(cleanup TRUE)
    endif()
    # }

    # Exclude standard variables {
    set(
        std_variables_list
        CMAKE_ROOT
        CMAKE_INCLUDE_CURRENT_DIR
        CMAKE_INSTALL_NAME_DIR
        CMAKE_CACHEFILE_DIR
        # Internal Hunter variables
        HUNTER_ROOT
        HUNTER_CACHED_ROOT
    )
    foreach(std_variable ${std_variables_list})
      string(COMPARE EQUAL "${std_variable}" "${x}" is_std_var)
      if(is_std_var)
        set(cleanup FALSE)
      endif()
    endforeach()

    set(
        std_patterns_list
        LIST_DIR
        SOURCE_DIR
        BINARY_DIR
    )
    foreach(std_pattern ${std_patterns_list})
      if(x MATCHES "_${std_pattern}$")
        set(cleanup FALSE)
      endif()
    endforeach()
    # }

    if(cleanup)
      hunter_status_debug("Removing variable from cache:")
      hunter_status_debug("  Name = '${x}'")
      hunter_status_debug("  Value = '${${x}}'")
      unset("${x}" CACHE)
    endif()
  endforeach()
  # }

  # Read list of all projects and unset regular, cache and environment variables
  # with name '<package>_{ROOT|Dir|DIR}'
  # {
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
    hunter_unsetvar("${x}_ROOT")
    hunter_unsetvar("${x}_Dir")
    hunter_unsetvar("${x}_DIR")
  endforeach()
  # }
endfunction()
