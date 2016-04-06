# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
  PACKAGE_NAME
  Protobuf
  VERSION
  "3.0.0-beta-2"
  URL
  "https://github.com/hunter-packages/protobuf/archive/v3.0.0-beta-2-hunter-1.tar.gz"
  SHA1
  15752454ef0cf119b58136e2f4ffe97baeaf07cd
  )

hunter_cmake_args(Protobuf CMAKE_ARGS  CMAKE_ARGS protobuf_BUILD_TESTS=OFF)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Protobuf)
hunter_download(PACKAGE_NAME Protobuf)
