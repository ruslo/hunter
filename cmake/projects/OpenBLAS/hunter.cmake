# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_configuration_types)
include(hunter_pick_scheme)
include(hunter_cmake_args)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    OpenBLAS
    VERSION
    0.3.0-p2
    URL
    "https://github.com/hunter-packages/OpenBLAS/archive/v0.3.0-p2.tar.gz"
    SHA1
    15875c6968eef0af7871d3cf91224570fece40cf
)

hunter_add_version(
    PACKAGE_NAME
    OpenBLAS
    VERSION
    0.2.20-p0
    URL
    "https://github.com/hunter-packages/OpenBLAS/archive/v0.2.20-p0.tar.gz"
    SHA1
    8f56263dda492f18972e55d51911a419d37eaba4
)

hunter_add_version(
    PACKAGE_NAME
    OpenBLAS
    VERSION
    0.2.19-p0
    URL
    "https://github.com/hunter-packages/OpenBLAS/archive/v0.2.19-p0.tar.gz"
    SHA1
    0d5ea6760304a2f76185e4e81959c0b2eb5bbc35
)

hunter_configuration_types(OpenBLAS CONFIGURATION_TYPES Release)
if(HUNTER_OpenBLAS_VERSION VERSION_LESS 0.3.0)
  hunter_pick_scheme(DEFAULT OpenBLAS)
  set(
      _openblas_unrelocatable_text_files
      PACKAGE_UNRELOCATABLE_TEXT_FILES
      "lib/cmake/openblas/OpenBLASConfig.cmake"
  )
else()
  hunter_cmake_args(
    OpenBLAS
    CMAKE_ARGS
    NOFORTRAN=1
  )
  hunter_pick_scheme(DEFAULT url_sha1_cmake)
  set(_openblas_unrelocatable_text_files "")
endif()
hunter_cacheable(OpenBLAS)
hunter_download(
    PACKAGE_NAME OpenBLAS
    PACKAGE_INTERNAL_DEPS_ID "2"
    ${_openblas_unrelocatable_text_files}
)
