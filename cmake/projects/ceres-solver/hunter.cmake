# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    ceres-solver
    VERSION
    "1.12.0"
    URL
    "https://github.com/hunter-packages/ceres-solver/archive/hunter.zip"
    SHA1
    8554129d92cdddaead42274a47322709f82943e0
)

# Probably more versions for real packages...

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

#Relocalable and cachable
hunter_cacheable(ceres-solver)

# Download package.
# Two versions of library will be build by default:
#     * libexample_A.a
#     * libexample_Ad.a
hunter_download(PACKAGE_NAME ceres-solver)
