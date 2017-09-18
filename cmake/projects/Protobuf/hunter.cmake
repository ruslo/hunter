# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Protobuf
    VERSION
    "3.0.0-p1"
    URL
    "https://github.com/hunter-packages/protobuf/releases/download/v3.0.0-hunter-3/protobuf-3.0.0-hunter-3.tar.gz"
    SHA1
    242443553ca20ab279427330e175a3c33ecbf265
)

hunter_add_version(
    PACKAGE_NAME
    Protobuf
    VERSION
    "3.1.0"
    URL
    "https://github.com/hunter-packages/protobuf/releases/download/v3.1.0-hunter/protobuf-3.1.0-hunter.tar.gz"
    SHA1
    a6cb2b4648d51518b1aca6e4662dc6bd61a0f662
)

hunter_add_version(
    PACKAGE_NAME
    Protobuf
    VERSION
    "3.3.0"
    URL
    "https://github.com/hunter-packages/protobuf/releases/download/v3.3.0-hunter-0/protobuf-3.3.0-hunter-0.tar.gz"
    SHA1
    d3780cd3cb936ac61c5f2d792b01fe52e1e88f5b
)

if(ANDROID OR IOS)
  hunter_cmake_args(
      Protobuf
      CMAKE_ARGS
        protobuf_BUILD_TESTS=OFF
        protobuf_BUILD_PROTOC=OFF
  )
elseif(MSVC)
  hunter_cmake_args(
      Protobuf
      CMAKE_ARGS
        protobuf_BUILD_TESTS=OFF
        protobuf_MSVC_STATIC_RUNTIME=OFF # Do not forece static runtime
  )
else()
  hunter_cmake_args(
      Protobuf
      CMAKE_ARGS
        protobuf_BUILD_TESTS=OFF
  )
endif()
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Protobuf)
hunter_download(PACKAGE_NAME Protobuf)
