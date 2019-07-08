
# The readline library is autotools-based, but does not include
# pkgconfig files.  So, a find module is needed to locate the outputs.
find_library(readline_library "libreadline.a")
find_library(history_library "libhistory.a")
find_path(readline_INCLUDE_DIRS readline/readline.h)

find_package(ncursesw CONFIG REQUIRED)

add_library("readline::readline" UNKNOWN IMPORTED)
set_target_properties("readline::readline"
	PROPERTIES
	INTERFACE_INCLUDE_DIRECTORIES "${readline_INCLUDE_DIRS}"
	IMPORTED_LOCATION "${readline_library}"
	INTERFACE_LINK_LIBRARIES PkgConfig::ncursesw
)

add_library("readline::history" UNKNOWN IMPORTED)
set_target_properties("readline::history"
	PROPERTIES
	INTERFACE_INCLUDE_DIRECTORIES "${readline_INCLUDE_DIRS}"
	IMPORTED_LOCATION "${history_library}"
)
