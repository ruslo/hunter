# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
  PACKAGE_NAME
  ZMQPP
  VERSION
  "4.1.2"
  URL
  "https://github.com/hunter-packages/zmqpp/archive/4.1.2-hunter-p2.tar.gz"
  SHA1
  549d2d0078ed636d90ed0febe687a058bdd0d64d
  )

hunter_add_version(
  PACKAGE_NAME
  ZMQPP
  VERSION
  "4.1.2-p3"
  URL
  "https://github.com/hunter-packages/zmqpp/archive/v4.1.2-p3.tar.gz"
  SHA1
  fdc3a0d5a4e907c79709ec2fc3fcf4105ff1b91a
  )

hunter_add_version(
  PACKAGE_NAME
  ZMQPP
  VERSION
  "4.2.0-p0"
  URL
  "https://github.com/hunter-packages/zmqpp/archive/v4.2.0-p0.tar.gz"
  SHA1
  0cf43d00fa22d26c5bf7a3c5d9f5f5c72cc92982
  )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ZMQPP)
hunter_download(PACKAGE_NAME ZMQPP)
