# Copyright (c) 2015-2016, University College London
# All rights reserved.
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_add_package)
include(hunter_configuration_types)

# Makes it possible to use syste cfitsio
hunter_add_version(
    PACKAGE_NAME
    F2C
    VERSION
    "0.0"
    URL
    "http://netlib.sandia.gov/f2c/libf2c.zip"
    SHA1
    e4a93aeee80c33525ffc87a5f802c30a7e6d1ea4
)

hunter_pick_scheme(DEFAULT F2C)
hunter_configuration_types(F2C CONFIGURATION_TYPES Release)
hunter_download(PACKAGE_NAME F2C)
