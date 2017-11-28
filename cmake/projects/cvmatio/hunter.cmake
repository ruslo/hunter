# Copyright (c) 2015, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_package)
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    cvmatio
    VERSION
    "1.0.28"
    URL
    https://github.com/hunter-packages/cvmatio/archive/v1.0.28.tar.gz
    SHA1
    42005086c8c4f85ffcf7f42652c24c8fec3fbe76
)

hunter_add_version(
    PACKAGE_NAME
    cvmatio
    VERSION
    "1.0.27-p3"
    URL
    https://github.com/hunter-packages/cvmatio/archive/v1.0.27-p3.tar.gz
    SHA1
    553032fac0014cae16a0a97feea88179fd34a1b4
)

hunter_add_version(
    PACKAGE_NAME
    cvmatio
    VERSION
    "1.0.27-p2"
    URL
    https://github.com/hunter-packages/cvmatio/archive/v1.0.27-p2.tar.gz  
    SHA1
    b96e89d2cf17650f3e2f9b86b3396a8cf74c77c7
)

hunter_add_version(
    PACKAGE_NAME
    cvmatio
    VERSION
    "1.0.26"
     URL
     "https://github.com/hunter-packages/cvmatio/archive/v1.0.26.tar.gz"
     SHA1
     b28ffa0509752dd6af8f034fbde5b63955ae8d1c
)

hunter_add_version(
    PACKAGE_NAME
    cvmatio
    VERSION
    "1.0.12"
     URL
     "https://github.com/hunter-packages/cvmatio/archive/v1.0.12.tar.gz"
     SHA1
     73eff2a0e9fed7246a4720f3d2aa1244b5daa43a
)

hunter_add_version(
    PACKAGE_NAME
    cvmatio
    VERSION
    "1.0.11"
     URL
     "https://github.com/hunter-packages/cvmatio/archive/v1.0.11.tar.gz"
     SHA1
     dd6f9af0d3a345879df4096b988ab6ff15985080
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(cvmatio)
hunter_download(PACKAGE_NAME cvmatio)
