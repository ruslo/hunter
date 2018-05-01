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
    "https://github.com/hunter-packages/protobuf/archive/v3.0.0-hunter-3.tar.gz"
    SHA1
    242443553ca20ab279427330e175a3c33ecbf265
)

hunter_add_version(
    PACKAGE_NAME
    Protobuf
    VERSION
    "3.0.0"
    URL
    "https://github.com/hunter-packages/protobuf/archive/v3.0.0-hunter-2.tar.gz"
    SHA1
    d1fa1592e05ab6ff3e4dbbcd9dfd9768a26ba94a
)

hunter_add_version(
    PACKAGE_NAME
    Protobuf
    VERSION
    "3.0.0-beta-2"
    URL
    "https://github.com/hunter-packages/protobuf/archive/v3.0.0-beta-2-hunter-1.tar.gz"
    SHA1
    d43d0d6bbfd3b65539ca467e2bcb0f7eeeb6a9d9
)

hunter_add_version(
    PACKAGE_NAME
    Protobuf
    VERSION
    "3.0.0-beta-2-p1"
    URL
    "https://github.com/hunter-packages/protobuf/archive/v3.0.0-beta-2-hunter-2.tar.gz"
    SHA1
    f91766a391284b7ccd192fa36bc3f09449b3c202
)

hunter_add_version(
    PACKAGE_NAME
    Protobuf
    VERSION
    "3.1.0"
    URL
    "https://github.com/hunter-packages/protobuf/archive/v3.1.0-hunter-4.tar.gz"
    SHA1
    8f58f2cbe6d3fae61451a5e29b703686fe4bc9d6
)

hunter_add_version(
    PACKAGE_NAME
    Protobuf
    VERSION
    "3.3.0"
    URL
    "https://github.com/hunter-packages/protobuf/archive/v3.3.0-hunter-1.tar.gz"
    SHA1
    8815a6be8188b2d6c8002924e752018b64658748
)

hunter_add_version(
    PACKAGE_NAME Protobuf
    VERSION "3.5.2-p0"
    URL "https://github.com/hunter-packages/protobuf/archive/v3.5.2-p0.tar.gz"
    SHA1 "0c1eacb460266dea7cd18c2009642fa192c15b70")

hunter_add_version(
    PACKAGE_NAME Protobuf
    VERSION "2.4.1-p0"
    URL "https://github.com/hunter-packages/protobuf/archive/v2.4.1-p0.tar.gz"
    SHA1 "c57c846131f804622057d83bf44144c179613e44")

string(
    COMPARE EQUAL "${CMAKE_SYSTEM_NAME}" "WindowsStore" _hunter_windows_store
)

if(ANDROID OR IOS)
  hunter_cmake_args(
      Protobuf
      CMAKE_ARGS
        protobuf_BUILD_TESTS=OFF
        protobuf_BUILD_PROTOC=OFF
  )
elseif(_hunter_windows_store)
  hunter_cmake_args(
      Protobuf
      CMAKE_ARGS
        protobuf_BUILD_TESTS=OFF
        protobuf_BUILD_PROTOC=OFF
        protobuf_MSVC_STATIC_RUNTIME=OFF # Do not force static runtime
  )
elseif(MSVC)
  hunter_cmake_args(
      Protobuf
      CMAKE_ARGS
        protobuf_BUILD_TESTS=OFF
        protobuf_MSVC_STATIC_RUNTIME=OFF # Do not force static runtime
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
