# Copyright (c) 2014-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    LLVMCompilerRT
    VERSION
    "6.0.1"
    URL
    "http://releases.llvm.org/6.0.1/compiler-rt-6.0.1.src.tar.xz"
    SHA1
    4a61bd09f31d3079e921205bb93fb7d05a95946b
)

hunter_add_version(
    PACKAGE_NAME
    LLVMCompilerRT
    VERSION
    "4.0.1-patched"
    URL
    "https://github.com/hunter-packages/LLVMCompilerRT/archive/v4.0.1-p0.tar.gz"
    SHA1
    561c29f1595c29f1d083567a7e669fec30cdfa44
)

hunter_add_version(
    PACKAGE_NAME
    LLVMCompilerRT
    VERSION
    "3.6.2"
    URL
    "http://llvm.org/releases/3.6.2/compiler-rt-3.6.2.src.tar.xz"
    SHA1
    c6c52d2923a60f1a2ca2f22fea1770fd2e25728d
)

hunter_add_version(
    PACKAGE_NAME
    LLVMCompilerRT
    VERSION
    "3.6.0"
    URL
    "http://llvm.org/releases/3.6.0/compiler-rt-3.6.0.src.tar.xz"
    SHA1
    771cbf0535dce1ca3a3be022377781e32fdea70e
)

hunter_add_version(
    PACKAGE_NAME
    LLVMCompilerRT
    VERSION
    "3.5.0"
    URL
    "http://llvm.org/releases/3.5.0/compiler-rt-3.5.0.src.tar.xz"
    SHA1
    61f3e78088ce4a0787835036f2d3c61ede11e928
)

hunter_add_version(
    PACKAGE_NAME
    LLVMCompilerRT
    VERSION
    "3.4.2"
    URL
    "http://llvm.org/releases/3.4/compiler-rt-3.4.src.tar.gz"
    SHA1
    d644b1e4f306f7ad35df0a134d14a1123cd9f082
)

hunter_pick_scheme(DEFAULT url_sha1_unpack)

hunter_download(PACKAGE_NAME LLVMCompilerRT)
