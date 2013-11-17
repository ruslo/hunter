# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_BOOST_SYSTEM_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_BOOST_SYSTEM_HUNTER_CMAKE 1)
endif()

include(hunter_download)

set(HUNTER_PACKAGE_BOOST_LIBRARY system)

hunter_download(
    PACKAGE_NAME
    Boost
    DOWNLOAD_SCHEME
    url_sha1_boost_library
)
