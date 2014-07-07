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

hunter_add_version_start(Example_A)

hunter_add_version(
    PACKAGE_NAME
    Example_A
    VERSION
    "1.0.1"
    URL
    "https://github.com/forexample/example-A/archive/v1.0.1.tar.gz"
    SHA1
    48179067d11828dc347f98fc148654f88766529d
)

hunter_pick_scheme(
     DEFAULT
     url_sha1_release_debug
     COMBINED
     url_sha1_combined_release_debug
)

hunter_download(PACKAGE_NAME Example_A)
