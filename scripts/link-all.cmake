cmake_minimum_required(VERSION 3.0)

string(COMPARE EQUAL "${HUNTER_INSTALL_PREFIX}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "HUNTER_INSTALL_PREFIX is empty")
endif()

if(NOT EXISTS "${HUNTER_INSTALL_PREFIX}")
  message(FATAL_ERROR "Directory not exists: ${HUNTER_INSTALL_PREFIX}")
endif()

string(COMPARE EQUAL "${LIST_OF_FILES}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "LIST_OF_FILES is empty")
endif()

if(NOT EXISTS "${LIST_OF_FILES}")
  message(FATAL_ERROR "File not exists: ${LIST_OF_FILES}")
endif()

string(COMPARE EQUAL "${SHELL_LINK_SCRIPT}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "SHELL_LINK_SCRIPT is empty")
endif()

if(NOT EXISTS "${SHELL_LINK_SCRIPT}")
  message(FATAL_ERROR "File not exists: ${SHELL_LINK_SCRIPT}")
endif()

string(COMPARE EQUAL "${CELLAR_RAW_DIRECTORY}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "CELLAR_RAW_DIRECTORY is empty")
endif()

if(NOT EXISTS "${CELLAR_RAW_DIRECTORY}")
  message(FATAL_ERROR "Directory not found: ${CELLAR_RAW_DIRECTORY}")
endif()

string(COMPARE EQUAL "${PYTHON_LINK_SCRIPT}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "PYTHON_LINK_SCRIPT is empty")
endif()

if(NOT EXISTS "${PYTHON_LINK_SCRIPT}")
  message(FATAL_ERROR "File not exists: ${PYTHON_LINK_SCRIPT}")
endif()

find_package(PythonInterp 3)
if(PYTHONINTERP_FOUND)
  message("Link files using Python: ${PYTHON_EXECUTABLE}")
  set(
      cmd
      "${PYTHON_EXECUTABLE}"
      "${PYTHON_LINK_SCRIPT}"
      "--list"
      "${LIST_OF_FILES}"
      "--cellar"
      "${CELLAR_RAW_DIRECTORY}"
      "--dest"
      "${HUNTER_INSTALL_PREFIX}"
  )
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${CELLAR_RAW_DIRECTORY}"
      RESULT_VARIABLE result
      OUTPUT_VARIABLE output
      ERROR_VARIABLE error
  )
  if(NOT result EQUAL 0)
    message(
        FATAL_ERROR
        "Python script failed: ${cmd}, ${result}, ${output}, ${error}"
        "(may help: https://stackoverflow.com/a/2009505/2288008)"
    )
  endif()
  return()
endif()

set(shell "/bin/bash")
if(EXISTS "${shell}")
  message("Link files using shell: ${shell}")
  set(cmd "${shell}" "${SHELL_LINK_SCRIPT}" "${HUNTER_INSTALL_PREFIX}")
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${CELLAR_RAW_DIRECTORY}"
      RESULT_VARIABLE result
      OUTPUT_VARIABLE output
      ERROR_VARIABLE error
  )
  if(NOT result EQUAL 0)
    message(
        FATAL_ERROR
        "Shell script failed: ${cmd}, ${result}, ${output}, ${error}"
    )
  endif()
  return()
endif()

message("Copy files")
file(STRINGS "${LIST_OF_FILES}" files)
foreach(x ${files})
  set(full_dst_path "${HUNTER_INSTALL_PREFIX}/${x}")
  get_filename_component(dst_dir "${full_dst_path}" DIRECTORY)
  file(COPY "${CELLAR_RAW_DIRECTORY}/${x}" DESTINATION "${dst_dir}")
endforeach()
