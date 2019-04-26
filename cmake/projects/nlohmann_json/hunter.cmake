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
  if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS "4.8")
    hunter_report_broken_package("The nlohmann_json package requires GCC 4.8 or newer.")
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

hunter_add_version(
    PACKAGE_NAME nlohmann_json
    VERSION "3.0.0"
    URL "https://github.com/nlohmann/json/archive/v3.0.0.tar.gz"
    SHA1 dbc3bb35d0bf9e21e5348291caa4142ab3ad418b
)

hunter_add_version(
    PACKAGE_NAME nlohmann_json
    VERSION "3.0.1"
    URL "https://github.com/nlohmann/json/archive/v3.0.1.tar.gz"
    SHA1 56d0b45d94b78b9bee73e8457d222457952d9270
)

hunter_add_version(
    PACKAGE_NAME nlohmann_json
    VERSION "3.1.0"
    URL "https://github.com/nlohmann/json/archive/v3.1.0.tar.gz"
    SHA1 d59929f5796e92c70dfc0fd9d37bf9b90265bfd3
)

hunter_add_version(
    PACKAGE_NAME nlohmann_json
    VERSION "3.1.1"
    URL "https://github.com/nlohmann/json/archive/v3.1.1.tar.gz"
    SHA1 3bdcd9dd6b3c5a0f376ac9c77020f3b9676d3e62
)

hunter_add_version(
    PACKAGE_NAME nlohmann_json
    VERSION "3.1.2"
    URL "https://github.com/nlohmann/json/archive/v3.1.2.tar.gz"
    SHA1 7b668b6af9839c7a46449a0d7f3389982c21ccbb
)

hunter_add_version(
    PACKAGE_NAME nlohmann_json
    VERSION "3.2.0"
    URL "https://github.com/nlohmann/json/archive/v3.2.0.tar.gz"
    SHA1 d14cd77f0badfdacd867861633d5a8ab45d7b9df
)

hunter_add_version(
    PACKAGE_NAME nlohmann_json
    VERSION "3.3.0"
    URL "https://github.com/nlohmann/json/archive/v3.3.0.tar.gz"
    SHA1 90842f04aadc1af1af600ce84c7fbe0d1dfc3d3c
)

hunter_add_version(
    PACKAGE_NAME nlohmann_json
    VERSION "3.4.0"
    URL "https://github.com/nlohmann/json/archive/v3.4.0.tar.gz"
    SHA1 eb8cedccbe5868cbd963bf72f5c27f4ebea51423
)

hunter_add_version(
    PACKAGE_NAME nlohmann_json
    VERSION "3.5.0"
    URL "https://github.com/nlohmann/json/archive/v3.5.0.tar.gz"
    SHA1 d5fb01debe55c2f56ef44dabb0539947434e815d
)

hunter_add_version(
    PACKAGE_NAME nlohmann_json
    VERSION "3.6.0"
    URL "https://github.com/nlohmann/json/archive/v3.6.0.tar.gz"
    SHA1 2848ddd69a5ddc6b48d134e9c7ad2f0896c67f9c
)

hunter_add_version(
    PACKAGE_NAME nlohmann_json
    VERSION "3.6.1"
    URL "https://github.com/nlohmann/json/archive/v3.6.1.tar.gz"
    SHA1 581e1d1c89c65670fb5212d74493a4545d9ab91c
)

hunter_cmake_args(nlohmann_json CMAKE_ARGS JSON_BuildTests=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(nlohmann_json)
hunter_download(PACKAGE_NAME nlohmann_json)
