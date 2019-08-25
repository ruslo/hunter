### HUNTER_STATUS_PRINT

If this variable is set to `TRUE` process information will be printed

### HUNTER_STATUS_DEBUG

Like `HUNTER_STATUS_PRINT` (more verbose). Additionally set `CMAKE_VERBOSE_MAKEFILE=YES` for external projects.

### HUNTER_ROOT

This variable setted automatically after incuding master `Hunter` file.

### HUNTER_BASE

This variable setted automatically after including master `Hunter` file. This variable will set `EP_BASE` property for current directory. See [documentation][link_documentation].

[link_documentation]: http://www.cmake.org/cmake/help/v2.8.12/cmake.html#module:ExternalProject