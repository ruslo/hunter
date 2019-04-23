cmake_minimum_required(VERSION 3.2)

if("${installdir}" STREQUAL "")
  message(FATAL_ERROR "installdir is empty")
endif()

if(NOT EXISTS "${installdir}")
  message(FATAL_ERROR "installdir doesn't exist")
endif()

if(NOT IS_DIRECTORY "${installdir}")
  message(FATAL_ERROR "installdir is not a directory")
endif()

file(
    GLOB_RECURSE
    configs_to_remove
    "${installdir}/lib/cmake/Boost-*/BoostConfig.cmake"
)

foreach(file_to_remove ${configs_to_remove})
  file(REMOVE "${file_to_remove}")
endforeach()
