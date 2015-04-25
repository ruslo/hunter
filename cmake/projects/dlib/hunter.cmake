# Copyright (c) 2015, David Hirvonen
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_DLIB_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_DLIB_HUNTER_CMAKE_ 1)
endif()

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    dlib
    VERSION
    "18.14"
    URL
    "https://github.com/davisking/dlib/archive/v18.14.tar.gz"
    SHA1
    85db9a8107cf5f65006921783164a0b2c0f3a5c0
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_no_install) # (for cmake modules and header-only libraries)

# hunter_pick_scheme(
#     DEFAULT
#     url_sha1_release_debug # For separate release/debug generators, like Makefile
#     COMBINED
#     url_sha1_combined_release_debug # For Xcode and Visual Studio
# )

hunter_download(PACKAGE_NAME dlib)