# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
  PACKAGE_NAME
  msgpack
  VERSION
  "1.4.1"
  URL
  "https://github.com/hunter-packages/msgpack-c/archive/cpp-1.4.1-hunter-p1.tar.gz"
  SHA1
  5074d28857661693b71c4bda3f8fc662e4c73990
  )

hunter_add_version(
  PACKAGE_NAME
  msgpack
  VERSION
  "1.4.1-p2"
  URL
  "https://github.com/hunter-packages/msgpack-c/archive/cpp-1.4.1-hunter-p2.tar.gz"
  SHA1
  eafdcb4c0a29d7416248740bd8132316a4b03910
  )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(msgpack)
hunter_download(PACKAGE_NAME msgpack)
