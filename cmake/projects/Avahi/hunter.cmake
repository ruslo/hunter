# Copyright (c) 2015, Damien Buhl 
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_AVAHI_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_AVAHI_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_pick_scheme)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    Avahi
    VERSION
    "0.6.31"
    URL
    "http://www.avahi.org/download/avahi-0.6.31.tar.gz"
    SHA1
    7e05bd78572c9088b03b1207a0ad5aba38490684
)

hunter_cmake_args(
    Avahi 
    CMAKE_ARGS
      BUILD_SHARED_LIBS=ON  
)

hunter_pick_scheme(DEFAULT url_sha1_avahi_autotools)
hunter_download(PACKAGE_NAME Avahi)
