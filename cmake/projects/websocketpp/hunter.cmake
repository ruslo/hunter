# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
  PACKAGE_NAME
  websocketpp
  VERSION
  "0.7.0"
  URL
  "https://github.com/hunter-packages/websocketpp/archive/0.7.0-hunter-p1.tar.gz"
  SHA1
  266c5a3c1b37eed2e49b8bc2ab42e77f97e95c3d
  )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(websocketpp)
hunter_download(PACKAGE_NAME websocketpp)
