# Copyright (c) 2014, Alexander Lamaison
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_LIBSSH2_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_LIBSSH2_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version_start(Libssh2)

hunter_add_version(
    PACKAGE_NAME
    Libssh2
    VERSION
    "1.4.4_DEV-cmake"
    URL
    "https://github.com/hunter-packages/libssh2/archive/v1.4.4-patch-1.tar.gz"
    SHA1
    4a5bb23ff19218f92af6e15e46ca5d997c3d7680
)

hunter_pick_scheme(
    DEFAULT url_sha1_release_debug
    COMBINED url_sha1_combined_release_debug
)

hunter_cmake_args(
    Libssh2
    CMAKE_ARGS
      BUILD_TESTING=OFF
      BUILD_EXAMPLES=OFF
      HUNTER_ENABLED=ON
      # Remove once https://github.com/ruslo/hunter/issues/50 is fixed
      HUNTER_SKIP_TOOLCHAIN_VERIFICATION=ON
)

hunter_download(PACKAGE_NAME Libssh2)
