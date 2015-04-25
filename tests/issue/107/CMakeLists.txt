cmake_minimum_required(VERSION 3.0)

set(OLD_UNIX "${UNIX}")
set(OLD_WIN32 "${WIN32}")
set(OLD_APPLE "${APPLE}")

include("../../../examples/common.cmake")
project(TestIssue107)

string(COMPARE EQUAL "${OLD_UNIX}" "${UNIX}" unix_is_good)
string(COMPARE EQUAL "${OLD_WIN32}" "${WIN32}" win32_is_good)
string(COMPARE EQUAL "${OLD_APPLE}" "${APPLE}" apple_is_good)

if(NOT unix_is_good)
  message(FATAL_ERROR "UNIX changed: ${OLD_UNIX} -> ${UNIX}")
endif()

# On cygwin WIN32 unset
if(NOT win32_is_good AND NOT CYGWIN)
  message(FATAL_ERROR "WIN32 changed: ${OLD_WIN32} -> ${WIN32}")
endif()

if(NOT apple_is_good)
  message(FATAL_ERROR "APPLE changed: ${OLD_APPLE} -> ${APPLE}")
endif()
