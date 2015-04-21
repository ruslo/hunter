# Copyright (c) 2015 Ruslan Baratov
# All rights reserved.

function(hunter_jobs_number jobs_options_varname toolchain_path)
  string(COMPARE EQUAL "${HUNTER_JOBS_NUMBER}" "0" disable_jobs)
  if(disable_jobs)
    set("${jobs_options_varname}" "" PARENT_SCOPE)
    return()
  endif()

  string(COMPARE EQUAL "${HUNTER_JOBS_NUMBER}" "" use_default_jobs)
  if(use_default_jobs)
    cmake_host_system_information(
        RESULT jobs_number
        QUERY NUMBER_OF_LOGICAL_CORES
    )
    string(COMPARE EQUAL "${jobs_number}" "0" is_zero)
    if(is_zero)
      hunter_status_debug("Number of logical cores is 0 - forcing 1")
      set(jobs_number "1")
    else()
      hunter_status_debug("Number of logical cores: ${jobs_number}")
    endif()
  else()
    set(jobs_number "${HUNTER_JOBS_NUMBER}")
  endif()

  string(COMPARE NOTEQUAL "${XCODE_VERSION}" "" is_xcode)
  string(COMPARE EQUAL "${CMAKE_GENERATOR}" "MSYS Makefiles" is_msys)
  string(COMPARE EQUAL "${CMAKE_GENERATOR}" "Unix Makefiles" is_makefiles)

  if(MINGW OR is_msys OR is_xcode OR is_makefiles)
    set("${jobs_options_varname}" "${jobs_number}" PARENT_SCOPE)
    return()
  endif()

  if(MSVC)
    file(
        APPEND
        "${toolchain_path}"
        "set(CMAKE_CXX_FLAGS \"\${CMAKE_CXX_FLAGS} /MP\" CACHE STRING \"\" FORCE)\n"
        "set(CMAKE_C_FLAGS \"\${CMAKE_C_FLAGS} /MP\" CACHE STRING \"\" FORCE)\n"
    )
  endif()

  set("${jobs_options_varname}" "" PARENT_SCOPE)
endfunction()
