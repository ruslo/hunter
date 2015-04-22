# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_CSVPARSERCPLUSPLUS_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_CSVPARSERCPLUSPLUS_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    CsvParserCPlusPlus
    VERSION
    "1.0.1"
    URL
    "https://github.com/headupinclouds/csv-parser-cplusplus/archive/v1.0.1.tar.gz"
    SHA1
    0eae583da157ecbe16d4360a2f147256821a0e18
)

hunter_cmake_args(CsvParserCPlusPlus CMAKE_ARGS CSVPARSER_BUILD_EXAMPLES=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME CsvParserCPlusPlus)
