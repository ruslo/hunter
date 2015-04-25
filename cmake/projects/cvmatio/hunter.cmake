# Copyright (c) 2015, David Hirvonen
# All rights reserved.

# This is a header-like file, so include guards needed
if(DEFINED HUNTER_CMAKE_PROJECTS_CVMATIO_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_CVMATIO_HUNTER_CMAKE_ 1)
endif()

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_add_package)

#hunter_add_package(TIFF)
#hunter_add_package(OpenCV)
#hunter_add_package(ZLIB)
#hunter_add_package(Boost COMPONENTS filesystem system serialization)

hunter_add_version(
    PACKAGE_NAME
    cvmatio
    VERSION
    "1.0.18"
     URL
    "https://github.com/headupinclouds/cvmatio/archive/v1.0.18.tar.gz"
     SHA1
    4bf8f9e9edc34a346220dc8ea307185d95283e93
 )

hunter_add_version(
    PACKAGE_NAME
    cvmatio
    VERSION
    "1.0.19"
    URL
    "https://github.com/headupinclouds/cvmatio/archive/v1.0.19.tar.gz"
    SHA1
    1c0760044d623ff1b4ee98873aaea222fb328234
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)

hunter_download(PACKAGE_NAME cvmatio)