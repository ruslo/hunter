# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_CLANG_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_CLANG_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version_start(Clang)

hunter_add_version(
    PACKAGE_NAME
    Clang
    VERSION
    "3.5.0"
    URL
    "http://llvm.org/releases/3.5.0/cfe-3.5.0.src.tar.xz"
    SHA1
    834cee2ed8dc6638a486d8d886b6dce3db675ffa
)

hunter_add_version(
    PACKAGE_NAME
    Clang
    VERSION
    "3.4.2"
    URL
    "http://llvm.org/releases/3.4.2/cfe-3.4.2.src.tar.gz"
    SHA1
    add5420b10c3c3a38c4dc2322f8b64ba0a5def97
)

hunter_pick_scheme(DEFAULT url_sha1_no_install)

hunter_download(PACKAGE_NAME Clang)
