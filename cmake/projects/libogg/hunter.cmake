include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
	PACKAGE_NAME
	libogg
	VERSION
	"1.3.2-cmake2"
	URL
	"https://github.com/Meralis40/ogg/archive/v1.3.2-cmake2.tar.gz"
	SHA1
	0b23c94a650c1c1d772bdc06bc7a2b9bd99bf814
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)

hunter_download(PACKAGE_NAME libogg)

