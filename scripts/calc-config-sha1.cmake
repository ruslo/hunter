# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# This script will include DEFAULT_CONFIG and USER_CONFIG files with
# hunter_config(...) commands and return a unified version of result file

# Add hunter_config module
if(NOT HUNTER_SELF)
  message(FATAL_ERROR "HUNTER_SELF is not defined")
endif()

list(APPEND CMAKE_MODULE_PATH "${HUNTER_SELF}/cmake/modules")

include(hunter_config)

# Include DEFAULT_CONFIG
if(NOT DEFAULT_CONFIG)
  message(FATAL_ERROR "DEFAULT_CONFIG is not defined")
endif()

if(NOT EXISTS "${DEFAULT_CONFIG}")
  message(FATAL_ERROR "File `${DEFAULT_CONFIG}` not exists")
endif()

include("${DEFAULT_CONFIG}")

# Include USER_CONFIG
if(NOT USER_CONFIG)
  message(FATAL_ERROR "USER_CONFIG is not defined")
endif()

if(NOT EXISTS "${USER_CONFIG}")
  message(FATAL_ERROR "File `${USER_CONFIG}` not exists")
endif()

include("${USER_CONFIG}")

# Create list of the projects
if(NOT DIRECTORY_WITH_PROJECTS)
  message(FATAL_ERROR "DIRECTORY_WITH_PROJECTS not defined")
endif()

if(NOT EXISTS "${DIRECTORY_WITH_PROJECTS}")
  message(FATAL_ERROR "Directory `${DIRECTORY_WITH_PROJECTS}` not exists")
endif()

if(NOT IS_DIRECTORY "${DIRECTORY_WITH_PROJECTS}")
  message(FATAL_ERROR "Path `${DIRECTORY_WITH_PROJECTS}` is not a directory")
endif()

file(
    GLOB projects
    RELATIVE "${DIRECTORY_WITH_PROJECTS}"
    "${DIRECTORY_WITH_PROJECTS}/*"
)

if(NOT projects)
  message(FATAL_ERROR "No projects found")
endif()

set(real_projects "")
foreach(x ${projects})
  if(IS_DIRECTORY "${DIRECTORY_WITH_PROJECTS}/${x}")
    list(APPEND real_projects "${x}")
  endif()
endforeach()

if(NOT real_projects)
  message(FATAL_ERROR "No projects found")
endif()

set(projects "${real_projects}")
list(SORT projects)

# Create unified version
if(NOT TEMP_DIRECTORY)
  message(FATAL_ERROR "TEMP_DIRECTORY is not defined")
endif()

if(NOT EXISTS "${TEMP_DIRECTORY}")
  message(FATAL_ERROR "${TEMP_DIRECTORY} not exists")
endif()

set(input_file "${TEMP_DIRECTORY}/config.cmake")
file(WRITE "${input_file}" "include(hunter_config)\n")
foreach(x ${projects})
  file(
      APPEND
      "${input_file}"
      "hunter_config(${x} "
      "VERSION ${HUNTER_${x}_VERSION}"
  )
  if(HUNTER_${x}_CMAKE_ARGS)
    file(APPEND "${input_file}" " CMAKE_ARGS")
    foreach(y ${HUNTER_${x}_CMAKE_ARGS})
      file(APPEND "${input_file}" " ${y}")
    endforeach()
  endif()
  file(APPEND "${input_file}" ")\n")
endforeach()
