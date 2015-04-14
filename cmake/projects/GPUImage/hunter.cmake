# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_GPUIMAGE_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_GPUIMAGE_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    GPUImage
    VERSION
    "0.1.6-hunter-1"
    URL
    "https://github.com/hunter-packages/GPUImage/archive/v0.1.6-hunter-1.tar.gz"
    SHA1
    53ed435a6768c6b3bc41a541d3a097426af4f446
)

hunter_pick_scheme(
    DEFAULT
    url_sha1_release_debug
    COMBINED
    url_sha1_combined_release_debug
)

hunter_download(PACKAGE_NAME GPUImage)
