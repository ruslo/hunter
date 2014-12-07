
if(DEFINED HUNTER_CMAKE_PROJECTS_COMET_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_COMET_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version_start(Comet)

hunter_add_version(
    PACKAGE_NAME
    Comet
    VERSION
    "4.0.0"
    URL
    "https://github.com/alamaison/comet/archive/4.0.0.tar.gz"
    SHA1
    24e54dbd719e5b4e51a6806ee52d2bd302e1e097
)

hunter_add_version(
    PACKAGE_NAME
    Comet
    VERSION
    "4.0.1"
    URL
    "https://github.com/alamaison/comet/archive/4.0.1.tar.gz"
    SHA1
    18aca7e870fea6b9e732bf1fb50b2294430730e7
)

hunter_cmake_args(
    Comet
    CMAKE_ARGS
      BUILD_TESTING=OFF
      BUILD_EXAMPLES=OFF
)

hunter_pick_scheme(
    DEFAULT url_sha1_release_debug
    COMBINED url_sha1_combined_release_debug
)

hunter_download(PACKAGE_NAME Comet)
