cmake_minimum_required(VERSION 3.0)

include("../../../../cmake/modules/hunter_boost_component_b2_args.cmake")
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
