# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

# List of versions here...

hunter_add_version(
    PACKAGE_NAME
    librtmp
    VERSION
    "2.4.0-p0"
    URL
    "https://github.com/caseymcc/rtmpdump/archive/2.4.0-p0.tar.gz"
    SHA1
    f540616e775d66ca618bd2c120dea188746d858c
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(librtmp)
hunter_download(PACKAGE_NAME librtmp)
