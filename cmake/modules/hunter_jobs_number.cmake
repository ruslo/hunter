# Copyright (c) 2015 Ruslan Baratov
# All rights reserved.

function(hunter_jobs_number jobs_options_varname toolchain_path)
  string(COMPARE EQUAL "${HUNTER_JOBS_NUMBER}" "0" disable_jobs)
  if(disable_jobs)
    set("${jobs_options_varname}" "" PARENT_SCOPE)
    return()
  endif()

  string(COMPARE EQUAL "$ENV{HUNTER_JOBS_NUMBER}" "0" disable_jobs)
  if(disable_jobs)
    set("${jobs_options_varname}" "" PARENT_SCOPE)
    return()
  endif()

  string(COMPARE NOTEQUAL "${HUNTER_JOBS_NUMBER}" "" has_cmake_var)
  string(COMPARE NOTEQUAL "$ENV{HUNTER_JOBS_NUMBER}" "" has_env_var)

  if(has_cmake_var)
    set(jobs_number "${HUNTER_JOBS_NUMBER}")
  elseif(has_env_var)
    set(jobs_number "$ENV{HUNTER_JOBS_NUMBER}")
  else()
    cmake_host_system_information(
        RESULT l_cores
        QUERY NUMBER_OF_LOGICAL_CORES
    )
    cmake_host_system_information(
        RESULT p_cores
        QUERY NUMBER_OF_PHYSICAL_CORES
    )
    hunter_status_debug("Number of physical cores: ${p_cores}")
    hunter_status_debug("Number of logical cores: ${l_cores}")

    set(jobs_number ${p_cores})
    if(jobs_number LESS l_cores)
      set(jobs_number ${l_cores})
    endif()

    string(COMPARE EQUAL "${jobs_number}" "0" is_zero)
    if(is_zero)
      hunter_status_debug("Force jobs number: 1")
      set(jobs_number "1")
    endif()

    hunter_status_debug("Number of jobs: ${jobs_number}")
  endif()

  string(COMPARE NOTEQUAL "${XCODE_VERSION}" "" is_xcode)
  string(COMPARE EQUAL "${CMAKE_GENERATOR}" "MSYS Makefiles" is_msys)
  string(COMPARE EQUAL "${CMAKE_GENERATOR}" "Unix Makefiles" is_makefiles)

  if(MSVC_IDE AND (MSVC_VERSION VERSION_LESS 1800))
    # No /maxcpucount:N support
    set(jobs_number "")
  endif()

  if(MINGW OR is_msys OR is_xcode OR is_makefiles OR MSVC_IDE)
    set("${jobs_options_varname}" "${jobs_number}" PARENT_SCOPE)
    return()
  endif()

  set("${jobs_options_varname}" "" PARENT_SCOPE)
endfunction()
