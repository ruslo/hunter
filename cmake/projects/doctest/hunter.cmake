# cmake/projects/Example/hunter.cmake

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    doctest
    VERSION
    "1.1.4"
    URL
    "https://github.com/piribes/doctest/archive/hunter.tar.gz"
    SHA1
    1b678730f0f36d31e33626d1c7f3130bd709be06
)

hunter_cmake_args(doctest CMAKE_ARGS
    DOCTEST_SKIP_EXAMPLES=ON
    DOCTEST_SKIP_COVERAGE=ON
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

hunter_cacheable(doctest)
hunter_download(PACKAGE_NAME doctest)
