# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

# Try to find RapidJSON library
#
# Input variables:
#     RAPIDJSON_ROOT - RapidJSON installation root
#
# Output variables:
#     RAPIDJSON_INCLUDE_DIR - include directories
#     RAPIDJSON_FOUND - is 'YES' if library found

if(HUNTER_STATUS_DEBUG)
  message("[hunter] Custom FindRapidJSON module")
endif()

find_path(
    RAPIDJSON_INCLUDE_DIR
    NAMES
    "rapidjson/rapidjson.h"
    HINTS
    "$ENV{RAPIDJSON_ROOT}/include"
    "${RAPIDJSON_ROOT}/include"
)

if(NOT RAPIDJSON_INCLUDE_DIR AND RapidJSON_FIND_REQUIRED)
  if(RAPIDJSON_ROOT)
    message("RAPIDJSON_ROOT(cmake): ${RAPIDJSON_ROOT}")
  endif()
  if($ENV{RAPIDJSON_ROOT})
    message("RAPIDJSON_ROOT(env): $ENV{RAPIDJSON_ROOT}")
  endif()

  message(
      FATAL_ERROR
      "RapidJSON not found (pattern 'include/rapidjson/rapidjson.h' not found)."
      "Please set RAPIDJSON_ROOT variable (cmake or environment)"
  )
endif()

if(RAPIDJSON_INCLUDE_DIR)
  set(RAPIDJSON_FOUND YES)
else()
  set(RAPIDJSON_FOUND NO)
endif()
