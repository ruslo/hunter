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
    2.5.0
    URL
    "https://github.com/t0p4/nlopt/archive/v2.5.0-p13.tar.gz"
    SHA1
    7f77de623145ef1ed537ea4a732f23ff0abae83d
)

hunter_cmake_args(
	NLopt
	CMAKE_ARGS
		NLOPT_CXX=ON
		BUILD_SHARED_LIBS=ON
		NLOPT_PYTHON=OFF
		NLOPT_OCTAVE=OFF
		NLOPT_MATLAB=OFF
		NLOPT_GUILE=OFF
		NLOPT_SWIG=OFF
		NLOPT_TESTS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(NLopt)
hunter_download(PACKAGE_NAME NLopt)
