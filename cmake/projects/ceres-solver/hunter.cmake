# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

# use base url for hunter fork
set(_hunter_ceres_base_url_fork "https://github.com/hunter-packages/ceres-solver/archive")

# List of versions
hunter_add_version(
    PACKAGE_NAME
    ceres-solver
    VERSION
    "1.12.0-p0"
    URL
    "${_hunter_ceres_base_url_fork}/v1.12.0-p0.tar.gz"
    SHA1
    c8a24d83bf4b26b99fd8fc3bed28a267e6247c85
)
# explicitly remove dependency on gflags (only needed for tests)
hunter_cmake_args(ceres-solver CMAKE_ARGS
    GFLAGS=OFF
    BUILD_TESTING=OFF
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

# Download package.
hunter_download(PACKAGE_NAME ceres-solver)

