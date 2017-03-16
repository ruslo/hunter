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
    # NUMBER_OF_LOGICAL_CORES is actually the number of logical cores
    # per physical core.
    # Excerpt from the CMake 3.7.1 source code:
    #     unsigned int GetNumberOfLogicalCPU(); // per physical cpu
    #     from Source/kwsys/SystemInformation.hxx.in
    # See https://gitlab.kitware.com/cmake/cmake/issues/16594
    cmake_host_system_information(
        RESULT l_cores
        QUERY NUMBER_OF_LOGICAL_CORES
    )
    cmake_host_system_information(
        RESULT p_cores
        QUERY NUMBER_OF_PHYSICAL_CORES
    )
    string(COMPARE EQUAL "${l_cores}" "0" l_cores_is_zero)
    if(l_cores_is_zero)
      hunter_status_debug("Number of logical cores per physical core is 0 - forcing 1")
      set(l_cores "1")
    else()
      hunter_status_debug("Number of logical cores per physical core: ${l_cores}")
    endif()
    string(COMPARE EQUAL "${p_cores}" "0" p_cores_is_zero)
    if(p_cores_is_zero)
      hunter_status_debug("Number of physical cores is 0 - forcing 1")
      set(p_cores "1")
    else()
      hunter_status_debug("Number of physical cores: ${p_cores}")
    endif()
    math(EXPR jobs_number "${l_cores} * ${p_cores}")
    hunter_status_debug("Total number of cores: ${jobs_number}")
  else()
    set(jobs_number "${HUNTER_JOBS_NUMBER}")
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
