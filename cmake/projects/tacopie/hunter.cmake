# cmake/projects/tacopie/hunter.cmake

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    tacopie
    VERSION
    "2.4.0"
    URL
    "https://github.com/Cylix/tacopie/archive/2.4.0.tar.gz"
    SHA1
    881ccc2d227275185bca80c288319054103bf33a
)

hunter_add_version(
    PACKAGE_NAME
    tacopie
    VERSION
    "2.3.0"
    URL
    "https://github.com/Cylix/tacopie/archive/2.3.0.tar.gz"
    SHA1
    f5d93c96d8c215c4ebecdbfff3bbfe1a62cd222e
)

hunter_add_version(
        PACKAGE_NAME
        tacopie
        VERSION
        "2.2.0"
        URL
        "https://github.com/Cylix/tacopie/archive/2.2.0.tar.gz"
        SHA1
        1d08256f03fcaa2f37ac0a37d591fe9360e3268c
)

hunter_add_version(
        PACKAGE_NAME
        tacopie
        VERSION
        "2.1.0"
        URL
        "https://github.com/Cylix/tacopie/archive/2.1.0.tar.gz"
        SHA1
        d32484fe5c06f8696b032be4aefc4698e69a7077
)

hunter_add_version(
        PACKAGE_NAME
        tacopie
        VERSION
        "2.0.1"
        URL
        "https://github.com/Cylix/tacopie/archive/2.0.1.tar.gz"
        SHA1
        88315c02735d2eaf7558afd2fb2dace09eed05f8
)

hunter_add_version(
        PACKAGE_NAME
        tacopie
        VERSION
        "2.0.0"
        URL
        "https://github.com/Cylix/tacopie/archive/2.0.0.tar.gz"
        SHA1
        7522bb269252719bff9aa4a9e82d17c59c87b336
)

hunter_add_version(
        PACKAGE_NAME
        tacopie
        VERSION
        "1.1.0"
        URL
        "https://github.com/Cylix/tacopie/archive/1.1.0.tar.gz"
        SHA1
        a89e0c08fbf84cda6f7421b8fe2c315bc7c51d9b
)

hunter_add_version(
        PACKAGE_NAME
        tacopie
        VERSION
        "1.0.0"
        URL
        "https://github.com/Cylix/tacopie/archive/1.0.0.tar.gz"
        SHA1
        7d473dbc3a6a170fdbee028e3e540cf331296fc7
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

# Download package.
# Two versions of library will be build by default:
#     * libexample_A.a
#     * libexample_Ad.a
hunter_download(PACKAGE_NAME tacopie)

