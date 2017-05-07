# Copyright (c) 2017 Ruslan Baratov
# All rights reserved.

# Set CMAKE_AR/CMAKE_RANLIB variables
function(hunter_pick_archiver)
  if(NOT CMAKE_INTERPROCEDURAL_OPTIMIZATION)
    return()
  endif()

  string(COMPARE EQUAL "${CMAKE_CXX_COMPILER_ID}" "AppleClang" is_apple_clang)
  string(COMPARE EQUAL "${CMAKE_CXX_COMPILER_ID}" "Clang" is_clang)
  string(COMPARE EQUAL "${CMAKE_CXX_COMPILER_ID}" "GNU" is_gcc)

  if(is_gcc)
    set(CMAKE_AR "${CMAKE_CXX_COMPILER_AR}" PARENT_SCOPE)
    set(CMAKE_RANLIB "${CMAKE_CXX_COMPILER_RANLIB}" PARENT_SCOPE)
    return()
  endif()

  if(is_apple_clang)
    # https://gitlab.kitware.com/cmake/cmake/blob/0e967e3b1dd8a705e304b4d94f1556249622d747/Modules/Compiler/Clang.cmake#L63-69
    return()
  endif()

  if(NOT is_clang)
    return()
  endif()

  if(ANDROID)
    # https://gitlab.kitware.com/cmake/cmake/blob/0e967e3b1dd8a705e304b4d94f1556249622d747/Modules/Compiler/Clang.cmake#L63-69
    return()
  endif()

  set(CMAKE_AR "${CMAKE_CXX_COMPILER_AR}" PARENT_SCOPE)
  set(CMAKE_RANLIB "${CMAKE_CXX_COMPILER_RANLIB}" PARENT_SCOPE)
endfunction()
