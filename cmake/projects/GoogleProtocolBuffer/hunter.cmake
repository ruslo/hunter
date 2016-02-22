
if(DEFINED HUNTER_CMAKE_PROJECTS_GOOGLE_PROTOCOL_BUFFER_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_GOOGLE_PROTOCOL_BUFFER_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    GoogleProtocolBuffer
    VERSION
    "3.0.0-beta-2"
    URL
    "https://github.com/google/protobuf/releases/download/v3.0.0-beta-2/protobuf-cpp-3.0.0-beta-2.tar.gz"
    SHA1
    7c6aa027e3f78084dbab72f2d32688de70431a75
)

hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(GoogleProtocolBuffer)
hunter_download(PACKAGE_NAME GoogleProtocolBuffer)
