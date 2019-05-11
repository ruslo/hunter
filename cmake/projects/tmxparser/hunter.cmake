# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    tmxparser
    VERSION
    2.1.0-ab4125b-p1
    URL
	"https://github.com/hunter-packages/tmxparser/archive/v2.1.0-ab4125b-p1.tar.gz"
    SHA1
    2f8cb2fba7b4241fbadc54f2f1928f72fb84cade
)

hunter_cmake_args(
	tmxparser
	CMAKE_ARGS
		USE_MINIZ=OFF
		BUILD_TINYXML2=OFF
		BUILD_TESTS=OFF
		BUILD_DOCS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(tmxparser)
hunter_download(PACKAGE_NAME tmxparser)
