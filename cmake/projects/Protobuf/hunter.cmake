if(DEFINED HUNTER_CMAKE_PROJECTS_PROTOBUF_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_PROTOBUF_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
  PACKAGE_NAME
  Protobuf
  VERSION
  "3.0.0-beta-2"
  URL
  "https://github.com/tatraian/protobuf/archive/protobuf-test-2.tar.gz"
  SHA1
  96af4dc198cf238265b695675b3d47be8347a236
  )

hunter_pick_scheme(DEFAULT url_sha1_cmake) 

hunter_download(PACKAGE_NAME Protobuf)
