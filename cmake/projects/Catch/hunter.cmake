# Copyright (c) 2016 Alexey Ulyanov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_pick_scheme)
include(hunter_cacheable)
include(hunter_download)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    Catch
    VERSION
    "2.0.1"
    URL
    "https://github.com/hunter-packages/Catch/archive/v2.0.1-p0.tar.gz"
    SHA1
    fbfa84ce24b33386f80fe34bc855455de8b8e45e
)

hunter_add_version(
    PACKAGE_NAME
    Catch
    VERSION
    "1.8.2-p0"
    URL
    "https://github.com/hunter-packages/Catch/archive/v1.8.2-p0-hunter.tar.gz"
    SHA1
    d8de13879e7be959d95a8e4a0daa2d5eb5fef807
)

hunter_add_version(
    PACKAGE_NAME
    Catch
    VERSION
    "1.5.9"
    URL
    "https://github.com/hunter-packages/Catch/releases/download/v1.5.9-hunter/v1.5.9-hunter.tar.gz"
    SHA1
    737cb1c98fedccceb95e7bfd385e5dea0ad5d047
)

hunter_cmake_args(
  Catch
  CMAKE_ARGS
    NO_SELFTEST=TRUE
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Catch)
hunter_download(PACKAGE_NAME Catch)
