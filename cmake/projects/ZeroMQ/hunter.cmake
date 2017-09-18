# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
  PACKAGE_NAME
  ZeroMQ
  VERSION
  "4.1.4-p2"
  URL
  "https://github.com/hunter-packages/zeromq4-1/archive/v4.1.4-hunter-p2.tar.gz"
  SHA1
  a3f39b9bbc23cf896cb78b3b33e3b46a45177eb5
  )

hunter_add_version(
  PACKAGE_NAME
  ZeroMQ
  VERSION
  "4.1.4"
  URL
  "https://github.com/hunter-packages/zeromq4-1/archive/v4.1.4-hunter-p1.tar.gz"
  SHA1
  be57db45f4f998c04d1804132b1302f923405fa4
  )

hunter_add_version(
    PACKAGE_NAME
    ZeroMQ
    VERSION
    "4.2.3"
    URL
    "https://github.com/hunter-packages/libzmq/releases/download/v4.2.3-hunter/libzmq-4.2.3-hunter.tar.gz"
    SHA1
    ad2f366f208bc1d964e7eab23efcac6e1116fc14
)

hunter_cmake_args(ZeroMQ CMAKE_ARGS ZMQ_BUILD_TESTS=OFF)
hunter_pick_scheme(DEFAULT url_sha1_cmake) 
hunter_cacheable(ZeroMQ)
hunter_download(PACKAGE_NAME ZeroMQ)
