### CMake 3.0

* http://www.cmake.org/cmake/resources/software.html
* For iOS build download and install [patched](https://github.com/ruslo/CMake/releases/tag/v3.0.0-ios-universal)
cmake version

### HUNTER_ROOT

This environment variable will point to working directory of hunter package manager. This is where all
downloaded archives and installed libraries will reside. It's recommended to use environment variable, but
also see [alternatives](https://github.com/hunter-packages/gate#effects).
For UNIX-family (Linux, Mac, Cygwin) users it propably
will be `export HUNTER_ROOT=/path/to/hunter/root` in `.bashrc` file, for Windows users:
`Control Panel` -> `System` -> `Advanced System Settings` -> `Environment Variables`. Do not forget to restart
all terminals/CMake-GUIs to apply changes in both cases. Note that all libraries will be installed in
two variants: `Debug` and `Release`. Check that there are enough disk space available (directory can
easily exceed 1 GB).

For example windows (VS 64/32 + cygwin):
* HUNTER_ROOT (> 5 GB)
 * HUNTER_ROOT/Downloads (~ 100 MB)
 * HUNTER_ROOT/Base/Build (~ 1 GB)
 * HUNTER_ROOT/Base/Source/Boost (> 2 GB) # boost builds in-source
 * HUNTER_ROOT/Base/Install (> 1 GB)

### Toolchains

Projects that uses different toolchains can be build in one HUNTER_ROOT directory if each toolchain
define `HUNTER_INSTALL_TAG` variable.
For example if [clang_libstdcxx](https://github.com/ruslo/polly/wiki/Toolchain-list#clang_libstdcxx)
and [gcc](https://github.com/ruslo/polly/wiki/Toolchain-list#gcc) toolchain used:

* HUNTER_ROOT/Base/Install/clang_libstdcxx
* HUNTER_ROOT/Base/Install/gcc

For each build `*_Dir` variables will be modified so standard `find_package` command will pick appropriate
include directories and libraries:

```cmake
find_package(Boost REQUIRED ...)

include_directories(${Boost_INCLUDE_DIR})
    # HUNTER_ROOT/Base/Install/clang_libstdcxx/include for clang_libstdcxx toolchain
    # HUNTER_ROOT/Base/Install/gcc/include for gcc toolchain

target_link_libraries(... PUBLIC ${Boost_LIBRARIES})
    # HUNTER_ROOT/Base/Install/clang_libstdcxx/lib/libboost_... for clang_libstdcxx toolchain
    # HUNTER_ROOT/Base/Install/gcc/lib/libboost_... for gcc toolchain
```

### Toolchains example (polly)

* Download archive, unpack it and set `POLLY_ROOT` environment variable. Unix-style:
```
> POLLY_VERSION="0.4.4"
> wget "https://github.com/ruslo/polly/archive/v${POLLY_VERSION}.tar.gz"
> tar xf "v${POLLY_VERSION}.tar.gz"
> export POLLY_ROOT="`pwd`/polly-${POLLY_VERSION}"
> export PATH="${POLLY_ROOT}/bin:${PATH}" # If you want to use build.py script
```

Now toolchains can be used:

```
> cmake -H. -B_builds -DCMAKE_TOOLCHAIN_FILE=${POLLY_ROOT}/sanitize_address.cmake
...
-- [polly] Used toolchain: Clang address sanitizer / c++11 support
...
> cmake --build _builds
...
clang++ -std=c++11 -fsanitize=address ...
...
```

Or using `build.py` script (generate and build, see `build.py --help` for all options):
```
> build.py --toolchain sanitize_address --verbose
...
-- [polly] Used toolchain: Clang address sanitizer / c++11 support
...
clang++ -std=c++11 -fsanitize=address ...
...
```

* https://github.com/ruslo/polly

