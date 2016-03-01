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
  "https://github.com/zeromq/zeromq4-1/archive/v4.1.4.tar.gz"
  SHA1
  840b24394e68450f46178c16878b0f9dc163e406  
  )

hunter_pick_scheme(DEFAULT url_sha1_cmake) 

hunter_download(PACKAGE_NAME ZeroMQ)
