# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_BOOST_MPI_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_BOOST_MPI_HUNTER_CMAKE 1)
endif()

include(hunter_download)
include(hunter_pick_scheme)
include(hunter_report_broken_package)

if(NOT HUNTER_Boost_VERSION VERSION_LESS 1.56.0 AND MSVC)
  hunter_report_broken_package(
      "boost.mpi library failed to install even if b2 build exit with 0."
      "Use boost 1.55.0-patched-3"
  )
endif()

hunter_pick_scheme(
    DEFAULT
    url_sha1_boost_library
    IPHONEOS
    url_sha1_boost_ios_library
)

hunter_download(
    PACKAGE_NAME
    Boost
    PACKAGE_COMPONENT
    mpi
    PACKAGE_INTERNAL_DEPS_ID "1"
)
