# Copyright (c) 2015 Aaditya Kalsi
# Copyright (c) 2017 Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

string(COMPARE EQUAL "${srcdir}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "'srcdir' should not be empty")
endif()

string(COMPARE EQUAL "${dstdir}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "'dstdir' should not be empty")
endif()

set(licenses "${HUNTER_INSTALL_LICENSE_FILES}")
string(COMPARE NOTEQUAL "${licenses}" "" explicit_licenses)

file(MAKE_DIRECTORY "${dstdir}")
if(NOT EXISTS "${dstdir}")
  message(FATAL_ERROR "Can't create directory: '${dstdir}'")
endif()
if(NOT IS_DIRECTORY "${dstdir}")
  message(FATAL_ERROR "Is not a directory: '${dstdir}'")
endif()

# Use set explicit license files for the package
# Testing variants:
# * Eigen "HUNTER_INSTALL_LICENSE_FILES=COPYING.MPL2" (good)
# * Eigen "HUNTER_INSTALL_LICENSE_FILES=COPYING.BSD;COPYING.GPL;COPYING.LGPL;COPYING.MINPACK;COPYING.MPL2" (good)
# * Eigen "HUNTER_INSTALL_LICENSE_FILES=COPYING.BSD;COPYING.GPL;COPYING.LGPL;COPYING.XXX;COPYING.MPL2" (bad)
# * Eigen no HUNTER_INSTALL_LICENSE_FILES (bad, no default license)
if(explicit_licenses)
  foreach(x ${licenses})
    if(NOT EXISTS "${srcdir}/${x}")
      message(FATAL_ERROR "File not found: '${srcdir}/${x}'")
    endif()
    file(COPY "${srcdir}/${x}" DESTINATION "${dstdir}")
  endforeach()
  return()
endif()

# Try standard names
foreach(x "LICENSE" "LICENSE.txt" "COPYING" "COPYING.txt" "license" "license.txt" "copying" "copying.txt")
  if(EXISTS "${srcdir}/${x}")
    file(COPY "${srcdir}/${x}" DESTINATION "${dstdir}")
    return()
  endif()
endforeach()

# If no standard name found try to glob LICENSE*
# Testing variants:
# * Boost
file(GLOB filelist "${srcdir}/LICENSE*")
foreach(x ${filelist})
  if(NOT IS_DIRECTORY "${x}")
    file(COPY "${x}" DESTINATION "${dstdir}")
  endif()
endforeach()
