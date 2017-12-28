# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_report_broken_package)

hunter_add_version(
  PACKAGE_NAME
  libuv
  VERSION
  2.0.0
  URL
  https://github.com/hunter-packages/libuv/archive/v2.0.0-hunter-release.tar.gz
  SHA1
  60dee8435f4c4136a2ecb6814a2f302641ef1093
  )

hunter_add_version(
  PACKAGE_NAME
  libuv
  VERSION
  2.0.0-p0
  URL
  "https://github.com/hunter-packages/libuv/archive/v2.0.0-p0.tar.gz"
  SHA1
  65a011219de5ad16e2de2df4b07b945a9e67035d
  )

hunter_add_version(
  PACKAGE_NAME
  libuv
  VERSION
  1.14.0-p0
  URL
  "https://github.com/hunter-packages/libuv/archive/v1.14.0-p0.tar.gz"
  SHA1
  b570a0b45a631b1955e7c58a3f35dcbf19c522d6
)

hunter_add_version(
  PACKAGE_NAME
  libuv
  VERSION
  1.14.0-p1
  URL
  "https://github.com/hunter-packages/libuv/archive/v1.14.0-p1.tar.gz"
  SHA1
  4b334b174f4abf4a7f41656e1cfe3c60ad9382ca
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)

hunter_cacheable(libuv)
hunter_download(PACKAGE_NAME libuv)
