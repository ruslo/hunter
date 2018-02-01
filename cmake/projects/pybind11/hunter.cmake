# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME pybind11
    VERSION "2.2.1"
    URL "https://github.com/pybind/pybind11/archive/v2.2.1.tar.gz"
    SHA1 "a2bfabe5ae736c3fc3408b5401a656c1f584b511")

hunter_cmake_args(pybind11 CMAKE_ARGS PYBIND11_TEST=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(pybind11)
hunter_download(PACKAGE_NAME pybind11)
