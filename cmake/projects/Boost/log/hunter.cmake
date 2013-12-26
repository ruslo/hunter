# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_BOOST_LOG_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_BOOST_LOG_HUNTER_CMAKE 1)
endif()

include(hunter_download)

string(COMPARE EQUAL "${CMAKE_OSX_SYSROOT}" "iphoneos" _hunter_result)
if(_hunter_result)
  set(_hunter_download_scheme url_sha1_boost_ios_library)
else()
  set(_hunter_download_scheme url_sha1_boost_library)
endif()
unset(_hunter_result)

hunter_download(
    PACKAGE_NAME
    Boost
    PACKAGE_COMPONENT
    log
    DOWNLOAD_SCHEME
    ${_hunter_download_scheme}
)

unset(_hunter_download_scheme)
