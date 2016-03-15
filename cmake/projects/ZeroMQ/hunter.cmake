if(DEFINED HUNTER_CMAKE_PROJECTS_ZEROMQ_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ZEROMQ_HUNTER_CMAKE_ 1)
endif()

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

hunter_cmake_args(ZeroMQ CMAKE_ARGS ZMQ_BUILD_TESTS=OFF)
hunter_pick_scheme(DEFAULT url_sha1_cmake) 
hunter_cacheable(ZeroMQ)
hunter_download(PACKAGE_NAME ZeroMQ)
