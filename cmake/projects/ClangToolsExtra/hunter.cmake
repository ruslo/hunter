# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    ClangToolsExtra
    VERSION
    "6.0.1"
    URL
    "http://llvm.org/releases/6.0.1/clang-tools-extra-6.0.1.src.tar.xz"
    SHA1
    0e4077e46dba66f9db17eb55b1e913b44cb19fd3
)

hunter_add_version(
    PACKAGE_NAME
    ClangToolsExtra
    VERSION
    "4.0.1"
    URL
    "http://llvm.org/releases/4.0.1/clang-tools-extra-4.0.1.src.tar.xz"
    SHA1
    414ccbadc4ba0658b34421a3855784af4e767796
)

hunter_add_version(
    PACKAGE_NAME
    ClangToolsExtra
    VERSION
    "3.6.2"
    URL
    "http://llvm.org/releases/3.6.2/clang-tools-extra-3.6.2.src.tar.xz"
    SHA1
    e4a92de7efda4c278e99f28ad52ef45eededd8ca
)

hunter_add_version(
    PACKAGE_NAME
    ClangToolsExtra
    VERSION
    "3.6.0"
    URL
    "http://llvm.org/releases/3.6.0/clang-tools-extra-3.6.0.src.tar.xz"
    SHA1
    30c6acd7404b9abf0338110818fba255d5744978
)

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

hunter_pick_scheme(DEFAULT url_sha1_unpack)

hunter_download(PACKAGE_NAME ClangToolsExtra)
