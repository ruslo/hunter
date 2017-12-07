# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
  PACKAGE_NAME lmdbxx
  VERSION "0.9.14.0"
  URL "https://github.com/isaachier/lmdbxx/archive/hunter-0.9.14.0-p1.tar.gz"
  SHA1 "1e6120db2f563f81ebe4160829b644d919dc574b")

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(lmdbxx)
hunter_download(PACKAGE_NAME lmdbxx)
