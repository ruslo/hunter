# Copyright (c) 2015 Ruslan Baratov
# All rights reserved.

string(COMPARE EQUAL "${from}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "'from' should not be empty")
endif()

string(COMPARE EQUAL "${to}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "'to' should not be empty")
endif()

if(NOT EXISTS "${from}")
  message(FATAL_ERROR "Directory not exists: ${from}")
endif()

if(NOT IS_DIRECTORY "${from}")
  message(FATAL_ERROR "Is not directory: ${from}")
endif()

file(GLOB files "${from}/*")
file(COPY ${files} DESTINATION "${to}")
