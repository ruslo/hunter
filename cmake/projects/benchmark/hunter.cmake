# Copyright (c) 2016, Dennis Sitelew
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
	 benchmark
    VERSION
	 "1.0.0"
    URL
    "https://github.com/google/benchmark/archive/v1.0.0.tar.gz"
    SHA1
    4f778985dce02d2e63262e6f388a24b595254a93
)

hunter_add_version(
    PACKAGE_NAME
	 benchmark
    VERSION
	 "0.1.0"
    URL
    "https://github.com/google/benchmark/archive/v0.1.0.tar.gz"
    SHA1
    5243a4de87e773b3a4c9a8880e581d4e64e16246
)

hunter_add_version(
    PACKAGE_NAME
	 benchmark
    VERSION
	 "0.0.9"
    URL
    "https://github.com/google/benchmark/archive/v0.0.9.tar.gz"
    SHA1
    4d795a209fe4ce8cf058ce8d12bb541991ac3149
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME benchmark)
