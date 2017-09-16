# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    drishti_faces
    VERSION
    1.1
    URL
    "https://github.com/elucideye/drishti-faces/archive/v1.1.tar.gz"
    SHA1
    2518ff034bd4c2967cbab4fc7a69d30cf0de057a
)

hunter_add_version(
    PACKAGE_NAME
    drishti_faces
    VERSION
    1.2
    URL
    "https://github.com/elucideye/drishti-faces/archive/v1.2.tar.gz"
    SHA1
    61cf9e459856a06d2da83f84f43f1a0e43955d7a    
)  

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(drishti_faces)
hunter_download(PACKAGE_NAME drishti_faces)
