# cmake/projects/Fruit/hunter.cmake

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
	PACKAGE_NAME
	Fruit
	VERSION
	"3.1.1-p0"
	URL
	"https://github.com/hunter-packages/fruit/archive/v3.1.1-p0.tar.gz"
	SHA1
	f406060a51ee80e14fc34ba9242a230182ac2b12
)

hunter_cmake_args(
	Fruit
	CMAKE_ARGS
	FRUIT_USES_BOOST=OFF
	FRUIT_BUILD_TESTS=OFF
	FRUIT_BUILD_EXAMPLES=OFF
	FRUIT_BUILD_EXTRAS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)

hunter_cacheable(Fruit)
hunter_download(PACKAGE_NAME Fruit)
