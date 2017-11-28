# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_report_broken_package)
include(hunter_status_debug)

# See https://github.com/nlohmann/json#supported-compilers
if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
  if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS "4.9")
    hunter_report_broken_package("The nlohmann_json package requires GCC 4.9 or newer.")
  endif()
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS "3.4")
    hunter_report_broken_package("The nlohmann_json package requires Clang 3.4 or newer.")
  endif()
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
  if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS "19.0")
    hunter_report_broken_package("The nlohmann_json package requires Visual Studio 2015 or newer.")
  endif()
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Intel")
  if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS "17.0.2")
    hunter_report_broken_package("The nlohmann_json package requires Intel compiler 17.0.2 or newer.")
  endif()
else()
  hunter_status_debug("You are using an untested compiler for the nlohmann_json package.")
endif()

hunter_add_version(
    PACKAGE_NAME nlohmann_json
    VERSION "2.1.1-p0"
    URL "https://github.com/hunter-packages/json/archive/v2.1.1-p0.tar.gz"
    SHA1 baf11b83387a7c4b2b6eb1e280f69084185813c0
)

hunter_add_version(
    PACKAGE_NAME nlohmann_json
    VERSION "2.1.1-p1"
    URL "https://github.com/hunter-packages/json/archive/v2.1.1-p1.tar.gz"
    SHA1 28ec11ef2596d38a11a2f4b3dfd63c3255c76f57
)

hunter_cmake_args(nlohmann_json CMAKE_ARGS JSON_BuildTests=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(nlohmann_json)
hunter_download(PACKAGE_NAME nlohmann_json)
