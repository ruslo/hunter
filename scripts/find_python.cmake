cmake_minimum_required(VERSION 3.0)

find_package(PythonInterp 3 QUIET)

if(NOT PYTHONINTERP_FOUND)
  message(FATAL_ERROR "Python not found")
endif()

message(${PYTHON_EXECUTABLE})
