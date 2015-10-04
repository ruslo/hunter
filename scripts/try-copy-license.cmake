# Copyright (c) 2015 Aaditya Kalsi
# All rights reserved.

string(COMPARE EQUAL "${srcdir}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "'srcdir' should not be empty")
endif()

string(COMPARE EQUAL "${dstfile}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "'dstfile' should not be empty")
endif()

# macro to copy file to a given file name
# CMake's file(COPY) works for a directory only
# so we use configure_file() with absolute paths
# to achieve this.
macro(copyfileto in out)
  # For debugging
  # message("-- copylicense: License found; ${in} -> ${out}")
  configure_file(${in} ${out} COPYONLY)
endmacro()

# find the license file to copy
if(EXISTS "${srcdir}/LICENSE")
  copyfileto("${srcdir}/LICENSE" ${dstfile})
  return()
endif()

if(EXISTS "${srcdir}/LICENSE.txt")
  copyfileto("${srcdir}/LICENSE.txt" ${dstfile})
  return()
endif()

if(EXISTS "${srcdir}/COPYING")
  copyfileto("${srcdir}/COPYING" ${dstfile})
  return()
endif()

if(EXISTS "${srcdir}/COPYING.txt")
  copyfileto("${srcdir}/COPYING.txt" ${dstfile})
  return()
endif()

if(EXISTS "${srcdir}/license")
  copyfileto("${srcdir}/license" ${dstfile})
  return()
endif()

if(EXISTS "${srcdir}/license.txt")
  copyfileto("${srcdir}/license.txt" ${dstfile})
  return()
endif()

if(EXISTS "${srcdir}/copying")
  copyfileto("${srcdir}/copying" ${dstfile})
  return()
endif()

if(EXISTS "${srcdir}/copying.txt")
  copyfileto("${srcdir}/copying.txt" ${dstfile})
  return()
endif()

# last effort; glob LICENSE*
file(GLOB filelist "${srcdir}/LICENSE*")
if(filelist)
  list(GET filelist 0 licfile)
  copyfileto(${licfile} ${dstfile})
endif()
