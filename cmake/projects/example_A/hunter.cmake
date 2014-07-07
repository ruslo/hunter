# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_EXAMPLE_A_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_EXAMPLE_A_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_package)
include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)
include(hunter_pick_scheme)

# Dependencies
# hunter_add_package(DepPackage)
# -- end

hunter_add_version_start(example_A)

hunter_add_version(
    PACKAGE_NAME
    example_A
    VERSION
    "1.0.1"
    URL
    "https://github.com/forexample/example-A/archive/v1.0.1.tar.gz"
    SHA1
    48179067d11828dc347f98fc148654f88766529d
)

hunter_add_version(
    PACKAGE_NAME
    example_A
    VERSION
    "1.0.2"
    URL
    "https://github.com/forexample/example-A/archive/v1.0.2.tar.gz"
    SHA1
    6a6f3de49b3809daba70d12224884262a42409af
)

hunter_add_version(
    PACKAGE_NAME
    example_A
    VERSION
    "1.0.3"
    URL
    "https://github.com/forexample/example-A/archive/v1.0.3.tar.gz"
    SHA1
    9e24d239d209ecaf54558f519462ae2867e2bfb0
)

hunter_pick_scheme(
     DEFAULT
     url_sha1_release_debug
     COMBINED
     url_sha1_combined_release_debug
)

hunter_download(PACKAGE_NAME example_A)
