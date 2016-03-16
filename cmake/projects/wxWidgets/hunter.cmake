# Copyright (c) 2015, Alexander Lamaison
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_WXWIDGETS_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_WXWIDGETS_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    wxWidgets
    VERSION
    "3.0.2"
    URL
    "https://github.com/alamaison/wxWidgets/archive/3.0.2-hunter-2.tar.gz"
    SHA1
    e8f5fe36a05fcb6e03c458186e6730994cc5f207
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)

hunter_cmake_args(
    wxWidgets
    CMAKE_ARGS
        WXBUILD_SYSTEM_ZLIB=ON
	WXBUILD_SYSTEM_PNG=ON
	WXBUILD_SYSTEM_TIFF=ON
	WXBUILD_SYSTEM_EXPAT=ON
)

hunter_download(PACKAGE_NAME wxWidgets)
