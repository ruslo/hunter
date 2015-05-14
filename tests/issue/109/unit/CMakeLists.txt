cmake_minimum_required(VERSION 3.0)

include("../../../../examples/common.cmake")
include(hunter_boost_component_b2_args)

project(TestIssue109Unit)

hunter_boost_component_b2_args(
  "bar"
  "FOO_OPT=1"
  negativeList
  )

string(COMPARE EQUAL "${negativeList}" "" is_empty)
if(NOT is_empty)
  message(FATAL_ERROR "negativeList should have been empty.")
endif()

hunter_boost_component_b2_args(
  "foo"
  "FOO_OPT=1"
  positiveList
  )
string(COMPARE EQUAL "${positiveList}" "-s;OPT=1" is_good)
if(NOT is_good)
  message(FATAL_ERROR "positiveList should have been '-s;OPT=1'")
endif()

hunter_boost_component_b2_args(
  "foo"
  "FOO_OPT=1;BAR_BAZ=1;FOO_BOO=1"
  positiveList
  )
string(COMPARE EQUAL "${positiveList}" "-s;OPT=1;-s;BOO=1" is_good)
if(NOT is_good)
  message(FATAL_ERROR "positiveList should have been '-s;OPT=1;-s;BOO=1'")
endif()

hunter_boost_component_b2_args(
  "bar"
  "FOO_OPT=1;BAR_BAZ=1;FOO_BOO=1"
  positiveList
  )
string(COMPARE EQUAL "${positiveList}" "-s;BAZ=1" is_good)
if(NOT is_good)
  message(FATAL_ERROR "positiveList should have been '-s;BAZ=1'")
endif()

# IOSTREAMS test
# --------------

hunter_boost_component_b2_args(
  "iostreams"
  ""
  ioList
  )

list(FIND ioList "NO_COMPRESSION=0" noCompPos)
if(noCompPos EQUAL -1)
  message(FATAL_ERROR "ioList should have 'NO_COMPRESSION=0'")
endif()

list(FIND ioList "NO_ZLIB=0" noZlibPos)
if(noZlibPos EQUAL -1)
  message(FATAL_ERROR "ioList should have 'NO_ZLIB=0'")
endif()

list(FIND ioList "NO_BZIP2=0" noBzipPos)
if(noBzipPos EQUAL -1)
  message(FATAL_ERROR "ioList should have 'NO_BZIP2=0'")
endif()

string(REPLACE ";" " " ioList ${ioList})
string(FIND ${ioList} "ZLIB_BINARY" zlibBinary)
if(zlibBinary EQUAL -1)
  message(FATAL_ERROR "ioList should have 'ZLIB_BINARY=...'")
endif()

string(FIND ${ioList} "BZIP2_BINARY" bzipBinary)
if(bzipBinary EQUAL -1)
  message(FATAL_ERROR "ioList should have 'BZIP2_BINARY=...'")
endif()
