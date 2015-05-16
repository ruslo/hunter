# Copyright (c) 2013, 2015 Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(ExternalProject) # ExternalProject_Add

# Just unpack the archive (do not install to CMAKE_INSTALL_PREFIX)
# Some use cases:
#   * Extra CMake modules
#   * Resources (data for testing, pictures, ...)
#   * Additional read-only sources (see LLVM)

# Note that archive will be unpacked to special internal location and can
# be found by <package-name>_ROOT variable. I.e. there are no files installed
# into CMAKE_INSTALL_PREFIX. For instance this scheme doesn't fit for
# header-only library. Even if header-only library has no build
# instructions it still can be installed. Actually using CMake CONFIG-mode
# (see 'find_package' manuals) is the best way to install such package.

list(APPEND CMAKE_MODULE_PATH "@HUNTER_SELF@/cmake/modules")

include(hunter_status_debug)
include(hunter_test_string_not_empty)

hunter_status_debug("Scheme: url_sha1_unpack")

# Check preconditions
hunter_test_string_not_empty("@HUNTER_SELF@")
hunter_test_string_not_empty("@HUNTER_EP_NAME@")
hunter_test_string_not_empty("@HUNTER_PACKAGE_URL@")
hunter_test_string_not_empty("@HUNTER_PACKAGE_SHA1@")
hunter_test_string_not_empty("@HUNTER_PACKAGE_DOWNLOAD_DIR@")
hunter_test_string_not_empty("@HUNTER_PACKAGE_SOURCE_DIR@")

ExternalProject_Add(
    "@HUNTER_EP_NAME@"
    URL
    @HUNTER_PACKAGE_URL@
    URL_HASH
    SHA1=@HUNTER_PACKAGE_SHA1@
    DOWNLOAD_DIR
    "@HUNTER_PACKAGE_DOWNLOAD_DIR@"
    SOURCE_DIR
    "@HUNTER_PACKAGE_SOURCE_DIR@"
    INSTALL_DIR
    "@HUNTER_PACKAGE_SOURCE_DIR@"
    CONFIGURE_COMMAND
    ""
    BUILD_COMMAND
    ""
    INSTALL_COMMAND
    ""
)
