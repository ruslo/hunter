# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    FastNoiseSIMD
    VERSION
    "0.8.0"
    URL
   "https://github.com/caseymcc/FastNoiseSIMD/archive/0.8.0.tar.gz"
    SHA1
    190cd6631e011afa4fe522aece8cc40def823e5d
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(FastNoiseSIMD)
hunter_download(PACKAGE_NAME FastNoiseSIMD)
