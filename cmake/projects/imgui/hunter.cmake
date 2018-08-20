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
    imgui
    VERSION
    "1.62"
    URL
   "https://github.com/hunter-packages/imgui/archive/v1.62.p0.tar.gz"
    SHA1
    0e1fb683036a45372bc34d39c29068443b6d97e6
)

hunter_cmake_args(
    imgui
    CMAKE_ARGS
        IMGUI_BUILD_EXAMPLES=OFF
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(imgui)
hunter_download(PACKAGE_NAME imgui)
