# cmake/projects/Fruit/hunter.cmake

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
	PACKAGE_NAME
	Fruit
	VERSION
	"3.0.0"
	URL
	"https://github.com/google/fruit/archive/v3.0.0.tar.gz"
	SHA1
	57fbf2417894b15169ef3cf30575271ce8ba2ead
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME Fruit)

hunter_cmake_args(
	Fruit
	CMAKE_ARGS
		"CMAKE_BUILD_TYPE=$<CMAKE_CONFIGURATION_TYPES>"
)
