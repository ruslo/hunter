# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
  PACKAGE_NAME
  autobahn-cpp
  VERSION
  "0.2.0"
  URL
  "https://github.com/tatraian/autobahn-cpp/archive/0.2.0-hunter-p3.tar.gz"
  SHA1
  660dcd964f5afe3d8fd469f21e87d55529019190
  )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(autobahn-cpp)
hunter_download(PACKAGE_NAME autobahn-cpp)
