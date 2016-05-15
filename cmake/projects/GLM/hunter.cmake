# Added by Thiago Bastos, 2016

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)
include(hunter_configuration_types)

hunter_add_version(
    PACKAGE_NAME
    GLM
    VERSION
    "0.9.7.4"
    URL
    "https://github.com/g-truc/glm/archive/0.9.7.4.tar.gz"
    SHA1
    cd3d91c1361de38cb2f7603ac06d185d8e10dc01
)

hunter_cacheable(GLM)
hunter_configuration_types(Lua CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME GLM)
