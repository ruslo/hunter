# Copyright (c) 2017, NeroBurner
# All rights reserved.

include(hunter_report_broken_package)

#hunter_cacheable(LAPACK) # install is always cacheable

# determine architecture
include(hunter_check_toolchain_definition)
hunter_check_toolchain_definition(NAME "_WIN64"    DEFINED _WIN64_defined)

if(_WIN64_defined)
  hunter_add_version(
    PACKAGE_NAME
    LAPACK
    VERSION
    "3.7.1"
    URL
    https://github.com/hunter-packages/lapack/releases/download/v3.7.1-p0/lapack-prebuilt-3.7.1-msvc-amd64.zip
    SHA1
    4a6e51690e36747d51e4334358abac99ca22378c
  )
else()
  hunter_report_broken_package("LAPACK on MSVC is only available on WIN64")
endif()

# pass cmake arguments
hunter_cmake_args(
    LAPACK
    CMAKE_ARGS
    HUNTER_INSTALL_LICENSE_FILES=LICENSE
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_unpack_install)

