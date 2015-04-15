Hunter
======

* Cross-platform package manager for C++ (based on CMake ExternalProject)
* Supported platforms: Linux, Mac, Windows, iOS

[![Build Status][link_master]][link_hunter]

[link_master]: https://travis-ci.org/ruslo/hunter.png?branch=master
[link_hunter]: https://travis-ci.org/ruslo/hunter

### What is it?

Every Hunter [release](https://github.com/ruslo/hunter/releases) archive is a meta-package with build instructions and URLs of real packages:
```
Hunter (0.4.2) = {
    Boost (1.55.0),
    GTest (1.7.0),
    JsonSpirit (0.0.1),
    OpenSSL (1.0.1h),
    ...
}
```

* Default versions can be found in
[cmake/config/default.cmake](https://github.com/ruslo/hunter/blob/master/cmake/configs/default.cmake) file and are [customizable](https://github.com/hunter-packages/gate#usage-custom-config)
* Per package versions are available in corresponding `hunter.cmake` file
(e.g. [GTest](https://github.com/ruslo/hunter/blob/master/cmake/projects/GTest/hunter.cmake)).
You can pick one version that already exists
or [add a new one](https://github.com/ruslo/hunter/wiki/usr.adding.new.package)

### Features

* Automatic dependencies download
 * List of dependencies is a part of CMake code of the project
 * No `emerge`, `apt-get`, `brew` etc. needed before build, now it's simply `cmake --build`
 * Express install instructions in terms of CMake commands instead of raw README text or other script
* Reusable `ExternalProject_Add` recipies ([DRY principle](http://c2.com/cgi/wiki?DontRepeatYourself))
 * Once written formula can be used by other projects, subprojects etc. without copying of collection of
superbuild files. Just change 2 lines of code: SHA1 and URL of hunter archive
* Multiple `root` directories without conflicts (Hunter-ID):
 * Hunter `0.8.3` use patched Boost `https://.../site-A/boost-patch.tar.gz` in `${HUNTER_ROOT}/_Base/1eae623/...`
 * Hunter `0.8.4` use patched Boost `https://.../site-B/boost-patch.tar.gz` in `${HUNTER_ROOT}/_Base/e07a124/...`
* Different build options per package (Config-ID):
 * Build `Foo` with option `FOO_WITH_OPENSSL=ON` in `${HUNTER_ROOT}/_Base/.../0fa873a`
 * Build `Foo` with option `FOO_WITH_OPENSSL=OFF` in `${HUNTER_ROOT}/_Base/.../e9da39c`
* Non-conflicting toolchain switching:
 * Build with `gcc` in `${HUNTER_ROOT}/_Base/.../.../d46ea0b`
 * Build with `clang` in `${HUNTER_ROOT}/_Base/.../.../c018e63`
* Customizable builds
 * Build 32/64 bit libraries
 * Debug/Release version of libraries
 * Build with different tools like [Clang Memory Sanitizer](http://clang.llvm.org/docs/MemorySanitizer.html)
 * Static/dynamic variant of library
 * ...
* Backward compatibility. Turn Hunter off by adding one option [HUNTER_ENABLED=OFF](https://github.com/ruslo/hunter/wiki/usr.variables#hunter_enabled) to use your old settings

### First step

* Set `HUNTER_ROOT` environment variable (recommended but not mandatory, see 
[other options](https://github.com/hunter-packages/gate#effects))

* Copy [gate](https://github.com/hunter-packages/gate) module to your project and include it:
```cmake
include("cmake/HunterGate.cmake")
```

* This module will download archive automatically from URL that you provide:

```cmake
HunterGate(
    URL "https://github.com/ruslo/hunter/archive/v0.5.0.tar.gz"
    SHA1 "8c9a553d3dbde74d411167ae67423416dd0e1a31"
)
```

* Now you can use it. For example let's download and install `boost.regex` and `boost.filesystem`:
```cmake
hunter_add_package(Boost COMPONENTS regex filesystem)
```

* That's all. And now well known cmake-style kung-fu:
```cmake
find_package(Boost REQUIRED regex filesystem)

include_directories(${Boost_INCLUDE_DIR})
add_executable(foo foo.cpp)
target_link_libraries(foo ${Boost_LIBRARIES})
```

... and build:
```
> cmake -H. -B_builds -DHUNTER_STATUS_DEBUG=ON -DCMAKE_BUILD_TYPE=Release
> cmake --build _builds --config Release
```

### Usage

* List of packages and usage instructions for each package can be found in [wiki sidebar]
(https://github.com/ruslo/hunter/wiki)
* [List of variables to control build](https://github.com/ruslo/hunter/wiki/usr.variables)
* [How to add a new CMake project](https://github.com/ruslo/hunter/wiki/usr.adding.new.package)
* [How to add a new custom-build project]
(https://github.com/ruslo/hunter/wiki/usr.adding.new.package.custom.scheme)
* [Multiple HunterGate commands (e.g. projects subprojects)]
(https://github.com/ruslo/hunter/wiki/usr.multiple.huntergate)

### iOS note

Install is [broken](http://public.kitware.com/Bug/view.php?id=12506) on iOS.
Patched version of [CMake](https://github.com/ruslo/CMake/releases) need to be used
(+ install universal libraries instread of one-arch).

### Toolchain switching

Each build can be run with different toolchains. In general the result is completely different root `lib`/`include` directories. For example on Windows you can simultaniously build Visual Studio (32/64), NMake, Cygwin and MinGW projects, on Linux GCC/Clang, on Mac Xcode, Makefile, iOS. Or choose different clang tools like static analyzer and sanitizers. Each toolchain file will be forwarded to external project so if you create toolchain with compiler `g++` and flag `-std=c++11` all dependent projects will be built by `g++ -std=c++11`. Information about toolchain has some internal representation (`toolchain.info`) and user can see first 7 digits (ID) of `SHA1` hash of this file. For example `gcc` has `d46ea0b`, `clang` has `c018e63`. See `Toolchain-ID` in build logs:
```
-- [hunter] [ Hunter-ID: ... | Config-ID: ... | Toolchain-ID: d46ea0b ]
-- [hunter] [ Hunter-ID: ... | Config-ID: ... | Toolchain-ID: c018e63 ]
```

### Uninstall

All directories inside `<HUNTER_ROOT>/_Base` are reconstructible.
You can remove all temps (downloads, unpacked directories, installed directories etc.) by command:
```bash
rm -rf "${HUNTER_ROOT}/_Base"
```
or remove particular snapshot (Hunter-ID) by command:
```bash
rm -rf "${HUNTER_ROOT}/_Base/62422b8" # remove installed libraries
rm -rf "${HUNTER_ROOT}/_Base/Download/Hunter/0.8.3/62422b8" # remove Hunter itself
```

### Questions?

Feel free to open new [issue][4] if you want to ask any questions.

### Contribution

Read [wiki][3] before making changes. Please send a patch as a pull request against the branch [develop][1]. After successfull build this branch will be merged to [master][2] automatically.

### Links
* [Gate to hunter packages](https://github.com/hunter-packages/gate)
* [Simple project example](https://github.com/forexample/hunter-simple)
* [Bigger one](https://github.com/ruslo/weather)
* [Toolchain examples](https://github.com/ruslo/polly)
* [Travis CI build example](https://github.com/forexample/hunter-simple/blob/master/.travis.yml)

[1]: https://github.com/ruslo/hunter/tree/develop
[2]: https://github.com/ruslo/hunter/tree/master
[3]: https://github.com/ruslo/hunter/wiki
[4]: https://github.com/ruslo/hunter/issues/new
