include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
	PACKAGE_NAME
	libogg
	VERSION
	"1.3.2-cmake3"
	URL
	"https://github.com/Meralis40/ogg/archive/v1.3.2-cmake3.tar.gz"
	SHA1
	2640E75997765339BA06BE0E4BFA66D85B70636A
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)

hunter_download(PACKAGE_NAME libogg)

