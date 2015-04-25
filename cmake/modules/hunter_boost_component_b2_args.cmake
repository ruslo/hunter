# Copyright (c) 2015, Aaditya Kalsi
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

macro(hunter_boost_component_b2_args compName boostCmakeArgs outList)
  string(TOUPPER ${compName} upperCompName)
  set("${outList}" )#empty
  foreach(nvPair ${boostCmakeArgs})
    string(REPLACE "${upperCompName}_" "" compNvPair ${nvPair})
    string(COMPARE EQUAL ${compNvPair} ${nvPair} is_same)
    if(NOT is_same)#component build option found
      list(APPEND "${outList}" "-s" "${compNvPair}")
    endif()
  endforeach()
endmacro(hunter_boost_component_b2_args)
