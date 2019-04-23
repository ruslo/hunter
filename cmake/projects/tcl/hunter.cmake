include(hunter_add_version)
include(hunter_configuration_types)
include(hunter_pick_scheme)
include(hunter_cacheable)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    tcl
    VERSION
    "core8.6.8"
    URL
    "https://downloads.sourceforge.net/project/tcl/Tcl/8.6.8/tcl-core8.6.8-src.tar.gz"
    SHA1
    e13199c76a7d1eae02f35cc9a20fabded6f815f5
)

hunter_configuration_types(tcl CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_tcl_autotools)
hunter_cacheable(tcl)
hunter_download(PACKAGE_NAME tcl
    PACKAGE_INTERNAL_DEPS_ID "1"
)
