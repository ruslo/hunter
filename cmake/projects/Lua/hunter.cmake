# Added by Denis Kerzhemanov, 2015

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)
include(hunter_configuration_types)

hunter_add_version(
    PACKAGE_NAME
    Lua
    VERSION
    "5.3.2"
    URL
    "https://github.com/hunter-packages/lua/archive/v5.3.2-p1.tar.gz"
    SHA1
    0697a2fa7fc657aac91e0a31f9f7709aebf1e3db
)

hunter_add_version(
    PACKAGE_NAME
    Lua
    VERSION
    "5.3.2-p2"
    URL
    "https://github.com/hunter-packages/lua/archive/v5.3.2-p2.tar.gz"
    SHA1
    6512fca43e01209f6e69803558d346ea767e52fc
)

# NOTE: Test '5.1.*' version with 'toluapp' package (!)
hunter_add_version(
    PACKAGE_NAME
    Lua
    VERSION
    "5.1.5-p0"
    URL
    "https://github.com/hunter-packages/lua/archive/v5.1.5-p0.tar.gz"
    SHA1
    70005ecaca16c155e684d966fc3e2b6ce8a70d6f
)

# NOTE: Test '5.1.*' version with 'toluapp' package (!)
hunter_add_version(
    PACKAGE_NAME
    Lua
    VERSION
    "5.1.5-p1"
    URL
    "https://github.com/hunter-packages/lua/archive/v5.1.5-p1.tar.gz"
    SHA1
    5387f5408ce189b2b34741ab4b28c0936b6bcbe3
)

# NOTE: Test '5.1.*' version with 'toluapp' package (!)
hunter_add_version(
    PACKAGE_NAME
    Lua
    VERSION
    "5.1.5-p2"
    URL
    "https://github.com/hunter-packages/lua/archive/v5.1.5-p2.tar.gz"
    SHA1
    cc804e53073686f31f59629dbc964538c60be521
)

# NOTE: Test '5.1.*' version with 'toluapp' package (!)
hunter_add_version(
    PACKAGE_NAME
    Lua
    VERSION
    "5.1.5-p3"
    URL
    "https://github.com/hunter-packages/lua/archive/v5.1.5-p3.tar.gz"
    SHA1
    9732277f78be6be26633f3cd8e3f810d8431ed51
)

hunter_cacheable(Lua)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME Lua)
