# cmake/projects/Example/hunter.cmake

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    debug_assert
    VERSION
    "1.3.2"
    URL
    "https://github.com/foonathan/debug_assert/archive/v1.3.2.tar.gz"
    SHA1
    f833029bd2bb2af1d7c93d3faf84898722b00bc2
)

hunter_add_version(
    PACKAGE_NAME
    debug_assert
    VERSION
    "1.3"
    URL
    "https://github.com/foonathan/debug_assert/archive/v1.3.tar.gz"
    SHA1
    0dd6930196488741ebb79680b261694a8141bf9c
)

hunter_add_version(
    PACKAGE_NAME
    debug_assert
    VERSION
    "1.2"
    URL
    "https://github.com/foonathan/debug_assert/archive/v1.2.tar.gz"
    SHA1
    0cc89e62d79198fe5df4fda9337bb3e44a0d58c3
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects
hunter_cacheable(debug_assert)
hunter_download(PACKAGE_NAME debug_assert)
