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
    "3.1.0-p4"
    URL
    "https://github.com/hunter-packages/protobuf/releases/download/v3.1.0-hunter-4/protobuf-3.1.0-hunter-4.tar.gz"
    SHA1
    8f58f2cbe6d3fae61451a5e29b703686fe4bc9d6
)


hunter_add_version(
    PACKAGE_NAME
    Protobuf
    VERSION
    "3.3.0-p1"
    URL
    "https://github.com/hunter-packages/protobuf/releases/download/v3.3.0-hunter-1/protobuf-3.3.0-hunter-1.tar.gz"
    SHA1
    8815a6be8188b2d6c8002924e752018b64658748
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
