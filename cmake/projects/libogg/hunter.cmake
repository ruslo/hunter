include(hunter_add_version)
include(hunter_cacheable)
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
  646672cabc9eec253c9199a872541e3a182f6062
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(libogg)
hunter_download(
    PACKAGE_NAME
    libogg
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/pkgconfig/ogg.pc"
)
