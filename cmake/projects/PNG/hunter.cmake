# Copyright (c) 2014-2015, Ruslan Baratov
# Copyright (c) 2015, Alexander Lamaison
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_PNG_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_PNG_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    PNG
    VERSION
    "1.6.16"
    URL
    "https://github.com/alamaison/libpng/archive/v1.6.16-hunter-3.tar.gz"
    SHA1
    903f19355c16221f8c8fa9253bda85c7d74ece3a
)

hunter_cmake_args(
    PNG
    CMAKE_ARGS
      PNG_SHARED=OFF
      PNG_TESTS=OFF
      # Remove once https://github.com/ruslo/hunter/issues/50 is fixed
      HUNTER_SKIP_TOOLCHAIN_VERIFICATION=ON
)

hunter_pick_scheme(
    DEFAULT url_sha1_release_debug
    COMBINED url_sha1_combined_release_debug
)

hunter_download(PACKAGE_NAME PNG)
