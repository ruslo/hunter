if(DEFINED HUNTER_CMAKE_PROJECTS_ZMQPP_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ZMQPP_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
  PACKAGE_NAME
  ZMQPP
  VERSION
  "4.1.2"
  URL
  "/home/kobold/Developments/zmqpp.tar.gz"
  SHA1
  4934c38a30a7f6eb54acc7f13c713bad5c838daf
  )

hunter_pick_scheme(DEFAULT url_sha1_cmake)

hunter_download(PACKAGE_NAME ZMQPP)
