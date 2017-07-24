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
    "1.12.0-p1"
    URL
    "${_hunter_ceres_base_url_fork}/v1.12.0-p1.tar.gz"
    SHA1
    d8676dcfe72c19d77aa099a894b94515761e8e94
)

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
hunter_cmake_args(ceres-solver CMAKE_ARGS
    # explicitly remove dependency on gflags (only needed for tests)
    GFLAGS=OFF
    # explicitly disable suitesparse support
    LAPACK=OFF
    SUITESPARSE=OFF
    # don't build tests
    BUILD_TESTING=OFF
    # also don't build examples: when suitesparse is enabled the examples need Fortran libraries
    BUILD_EXAMPLES=OFF
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

# Download package.
hunter_download(PACKAGE_NAME ceres-solver)

