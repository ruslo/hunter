
if(DEFINED HUNTER_CMAKE_PROJECTS_WASHER_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_WASHER_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Washer
    VERSION
    "0.1.1"
    URL
    "https://github.com/alamaison/washer/archive/0.1.1.tar.gz"
    SHA1
    dc979493884e1eed89b5e0c1d03284c40d897a4e
)

hunter_add_version(
    PACKAGE_NAME
    Washer
    VERSION
    "0.1.0"
    URL
    "https://github.com/alamaison/washer/archive/0.1.0.tar.gz"
    SHA1
    dc0e12f1f3eafdf9af98887a62828d6f513b2446
)

hunter_cmake_args(
    Washer
    CMAKE_ARGS
      BUILD_TESTING=OFF
      BUILD_DOCS=OFF
)

hunter_pick_scheme(
    DEFAULT url_sha1_release_debug
    COMBINED url_sha1_combined_release_debug
)

hunter_download(PACKAGE_NAME Washer)
