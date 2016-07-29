if(DEFINED HUNTER_CMAKE_PROJECTS_ARMADILLO_HUNTER_CMAKE_)
	return()
else()
	set(HUNTER_CMAKE_PROJECTS_ARMADILLO_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
	PACKAGE_NAME
	armadillo
	VERSION
	"5.600.2"
	URL
	"https://github.com/thomasfeher/armadillo/archive/v5.600.2.tar.gz"
	SHA1
	2cb74a9228ffe9ccf4b48d7cccf344365867020b
	)

hunter_pick_scheme(DEFAULT url_sha1_armadillo) # Use new custom scheme
hunter_download(PACKAGE_NAME armadillo)
