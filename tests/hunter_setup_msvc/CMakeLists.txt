# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")
project(TestModuleHunterSetupMsvcArch)

include(hunter_setup_msvc_arch)

function(run_check generator expected_arch)
  set(MSVC TRUE)
  set(HUNTER_MSVC_ARCH "")
  set(CMAKE_GENERATOR ${generator})

  message("Run test")
  message("  generator: ${CMAKE_GENERATOR}")
  message("  expected arch: ${expected_arch}")

  hunter_setup_msvc_arch()

  string(COMPARE EQUAL "${HUNTER_MSVC_ARCH}" "${expected_arch}" is_equal)
  if(is_equal)
    message("OK")
  else()
    message(FATAL_ERROR "Unexpected: ${HUNTER_MSVC_ARCH}")
  endif()
endfunction()

run_check("Visual Studio 8 2005" "x86")
run_check("Visual Studio 9 2008" "x86")
run_check("Visual Studio 10 2010" "x86")
run_check("Visual Studio 11 2012" "x86")
run_check("Visual Studio 12 2013" "x86")

run_check("Visual Studio 8 2005 Win64" "amd64")
run_check("Visual Studio 9 2008 Win64" "amd64")
run_check("Visual Studio 10 2010 Win64" "amd64")
run_check("Visual Studio 11 2012 Win64" "amd64")
run_check("Visual Studio 12 2013 Win64" "amd64")

run_check("Visual Studio 8 2005 ARM" "x86_arm")
run_check("Visual Studio 9 2008 ARM" "x86_arm")
run_check("Visual Studio 10 2010 ARM" "x86_arm")
run_check("Visual Studio 11 2012 ARM" "x86_arm")
run_check("Visual Studio 12 2013 ARM" "x86_arm")
