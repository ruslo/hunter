# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")
project(TestModuleHunterSetupMsvcArch)

include(hunter_setup_msvc)

function(run_check generator expected_arch expected_version expected_year)
  set(MSVC TRUE)

  set(HUNTER_MSVC_ARCH "")
  set(HUNTER_MSVC_VERSION "")
  set(HUNTER_MSVC_YEAR "")

  unset(HUNTER_MSVC_VCVARSALL)
  unset(HUNTER_MSVC_VCVARSALL CACHE)

  set(CMAKE_GENERATOR ${generator})

  message("Run test")
  message("  generator: ${CMAKE_GENERATOR}")
  message("  expected arch: ${expected_arch}")
  message("  expected version: ${expected_version}")
  message("  expected year: ${expected_year}")
  
  set(HUNTER_TESTING TRUE)
  hunter_setup_msvc()

  string(COMPARE EQUAL "${HUNTER_MSVC_ARCH}" "${expected_arch}" is_equal)
  if(is_equal)
    message("OK")
  else()
    message(FATAL_ERROR "Unexpected: ${HUNTER_MSVC_ARCH}")
  endif()
  
  string(COMPARE EQUAL "${HUNTER_MSVC_VERSION}" "${expected_version}" is_equal)
  if(is_equal)
    message("OK")
  else()
    message(FATAL_ERROR "Unexpected: ${HUNTER_MSVC_VERSION}")
  endif()
  
  string(COMPARE EQUAL "${HUNTER_MSVC_YEAR}" "${expected_year}" is_equal)
  if(is_equal)
    message("OK")
  else()
    message(FATAL_ERROR "Unexpected: ${HUNTER_MSVC_YEAR}")
  endif()
endfunction()

run_check("Visual Studio 8 2005" "x86" "8" "2005")
run_check("Visual Studio 9 2008" "x86" "9" "2008")
run_check("Visual Studio 10 2010" "x86" "10" "2010")
run_check("Visual Studio 11 2012" "x86" "11" "2012")
run_check("Visual Studio 12 2013" "x86" "12" "2013")
run_check("Visual Studio 14 2015" "x86" "14" "2015")

run_check("Visual Studio 8 2005 Win64" "amd64" "8" "2005")
run_check("Visual Studio 9 2008 Win64" "amd64" "9" "2008")
run_check("Visual Studio 10 2010 Win64" "amd64" "10" "2010")
run_check("Visual Studio 11 2012 Win64" "amd64" "11" "2012")
run_check("Visual Studio 12 2013 Win64" "amd64" "12" "2013")
run_check("Visual Studio 14 2015 Win64" "amd64" "14" "2015")

run_check("Visual Studio 8 2005 ARM" "x86_arm" "8" "2005")
run_check("Visual Studio 9 2008 ARM" "x86_arm" "9" "2008")
run_check("Visual Studio 10 2010 ARM" "x86_arm" "10" "2010")
run_check("Visual Studio 11 2012 ARM" "x86_arm" "11" "2012")
run_check("Visual Studio 12 2013 ARM" "x86_arm" "12" "2013")
run_check("Visual Studio 14 2015 ARM" "x86_arm" "14" "2015")
