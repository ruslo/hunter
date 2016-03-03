if(DEFINED HUNTER_CMAKE_PROJECTS_ZEROMQ_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ZEROMQ_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
  PACKAGE_NAME
  ZeroMQ
  VERSION
  "4.1.4"
  URL
  "https://github.com/hunter-packages/zeromq4-1/archive/v4.1.4-hunter.tar.gz"
  SHA1
  aeb0650b1d1b2e5f7c9da81d4e294716eb16e91e
  )

hunter_pick_scheme(DEFAULT url_sha1_cmake) 

hunter_download(PACKAGE_NAME ZeroMQ)
