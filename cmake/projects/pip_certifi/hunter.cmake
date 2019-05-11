# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_certifi
    VERSION
    2019.3.9
    URL
    "https://files.pythonhosted.org/packages/06/b8/d1ea38513c22e8c906275d135818fee16ad8495985956a9b7e2bb21942a1/certifi-2019.3.9.tar.gz"
    SHA1
    f3873edcfc60c52e97e6601b2576ccdac419281a
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_certifi)
hunter_download(PACKAGE_NAME pip_certifi)
