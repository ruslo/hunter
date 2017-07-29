# cmake/projects/cpp_redis/hunter.cmake

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    cpp_redis
    VERSION
    "3.5.0-h1"
    URL
    "https://github.com/hunter-packages/cpp_redis/archive/3.5.0-h1.tar.gz"
    SHA1
    b88a7f6c303122f4f62f0c37cce8625a592b51d1
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

# Download package.
# Two versions of library will be build by default:
#     * libcpp_redis.a
#     * libcpp_redisd.a
hunter_cacheable(cpp_redis)
hunter_download(PACKAGE_NAME cpp_redis)
