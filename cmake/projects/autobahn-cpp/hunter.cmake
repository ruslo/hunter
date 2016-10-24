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
  "https://github.com/hunter-packages/autobahn-cpp/archive/0.2.0-hunter-p1.tar.gz"
  SHA1
  43e37635abc924017aeff1036479fde1aea36ceb
  )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(autobahn-cpp)
hunter_download(PACKAGE_NAME autobahn-cpp)
