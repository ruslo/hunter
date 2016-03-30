if(DEFINED HUNTER_CMAKE_PROJECTS_ZMQPP_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ZMQPP_HUNTER_CMAKE_ 1)
endif()

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

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ZMQPP)
hunter_download(PACKAGE_NAME ZMQPP)
