# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_CLANGTOOLSEXTRA_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_CLANGTOOLSEXTRA_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version_start(ClangToolsExtra)

hunter_add_version(
    PACKAGE_NAME
    ClangToolsExtra
    VERSION
    "3.5.0"
    URL
    "http://llvm.org/releases/3.5.0/clang-tools-extra-3.5.0.src.tar.xz"
    SHA1
    74a84493e3313c180490a4affbb92d61ee4f0d21
)

hunter_add_version(
    PACKAGE_NAME
    ClangToolsExtra
    VERSION
    "3.4.2"
    URL
    "http://llvm.org/releases/3.4/clang-tools-extra-3.4.src.tar.gz"
    SHA1
    56afa36c2ddd11a53f1e199152b04dfb9347d93a
)

hunter_pick_scheme(DEFAULT url_sha1_no_install)

hunter_download(PACKAGE_NAME ClangToolsExtra)
