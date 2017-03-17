# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
  PACKAGE_NAME
  yaml-cpp
  VERSION
  "0.5.3"
  URL
  "https://github.com/hunter-packages/yaml-cpp/archive/release-0.5.3-hunter-p2.tar.gz"
  SHA1
  ee1fe3713409de48b203f6b631c1284190d95671
  )

hunter_cmake_args(yaml-cpp CMAKE_ARGS YAML_CPP_BUILD_TOOLS=OFF)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(yaml-cpp)
hunter_download(PACKAGE_NAME yaml-cpp)
