# cmake/projects/libjson-rpc-cpp/hunter.cmake

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

# List of versions:

hunter_add_version(
    PACKAGE_NAME
    libjson-rpc-cpp
    VERSION
    "0.7.0-p0"
    URL
    "https://github.com/hunter-packages/libjson-rpc-cpp/archive/v0.7.0-p0.tar.gz"
    SHA1
    ddd5f12dfde6f7072d271071bd2c7b0a487de97f
)

hunter_add_version(
    PACKAGE_NAME
    libjson-rpc-cpp
    VERSION
    "0.7.0-p3"
    URL
    "https://github.com/hunter-packages/libjson-rpc-cpp/archive/v0.7.0-p3.tar.gz"
    SHA1
    f2c7e2fd73c1ad3662d275c2b2e515b2ddf02a72
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)

set(_hunter_unix_cmake_args "")
if(UNIX)
  # UNIX options. Disable all as they don't compile on macOS.
  set(
    _hunter_unix_cmake_args
    UNIX_DOMAIN_SOCKET_SERVER=OFF
    UNIX_DOMAIN_SOCKET_CLIENT=OFF
    FILE_DESCRIPTOR_SERVER=OFF
    FILE_DESCRIPTOR_CLIENT=OFF
  )
endif()

hunter_cmake_args(
    libjson-rpc-cpp
    CMAKE_ARGS
    BUILD_STATIC_LIBS=ON
    WITH_COVERAGE=OFF
    COMPILE_STUBGEN=OFF
    COMPILE_EXAMPLES=OFF
    COMPILE_TESTS=OFF
    HTTP_CLIENT=ON
    HTTP_SERVER=OFF  # Requires microhttpd library.
    ${_hunter_unix_cmake_args}
)

hunter_cacheable(libjson-rpc-cpp)
hunter_download(PACKAGE_NAME libjson-rpc-cpp)
