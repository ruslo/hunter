# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_SOBER_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_SOBER_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Sober
    VERSION
    "0.1.2"
    URL
    "https://github.com/ruslo/sober/archive/v0.1.2.tar.gz"
    SHA1
    ecbcb094ad7d1523eb1d28eccabaeed5fce44c41
)

hunter_add_version(
    PACKAGE_NAME
    Sober
    VERSION
    "0.0.1"
    URL
    "https://github.com/ruslo/sober/archive/v0.0.1.tar.gz"
    SHA1
    326987c0807ff7e8caa851476bbd57d0d01604e0
)

hunter_add_version(
    PACKAGE_NAME
    Sober
    VERSION
    "0.0.2"
    URL
    "https://github.com/ruslo/sober/archive/v0.0.2.tar.gz"
    SHA1
    5c0b9ed42f897376610d5b97860c479024b9207d
)

hunter_add_version(
    PACKAGE_NAME
    Sober
    VERSION
    "0.1.0"
    URL
    "https://github.com/ruslo/sober/archive/v0.1.0.tar.gz"
    SHA1
    17aaf1236bb914bf3d93dc1d132ee18a6130288f
)

hunter_add_version(
    PACKAGE_NAME
    Sober
    VERSION
    "0.1.1"
    URL
    "https://github.com/ruslo/sober/archive/v0.1.1.tar.gz"
    SHA1
    76ef9e7cef36d7a6ce125b1ad4ad732d7fc4d62a
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME Sober)
