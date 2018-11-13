# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    NLopt
    VERSION
    2.5.0-p0
    URL
    "https://github.com/hunter-packages/nlopt/archive/v2.5.0-p0.tar.gz"
    SHA1
    30838bcdc191b6dae8af1d0e8f704fe51a0ad3ef
)

hunter_cmake_args(NLopt CMAKE_ARGS
		NLOPT_CXX=OFF
		NLOPT_PYTHON=OFF
		NLOPT_OCTAVE=OFF
		NLOPT_MATLAB=OFF
		NLOPT_GUILE=OFF
		NLOPT_SWIG=OFF
		NLOPT_TESTS=OFF
		NLOPT_LINK_PYTHON=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(NLopt)
hunter_download(PACKAGE_NAME NLopt)
