Hunter
======

* Cross-platform package manager for C++ (based on CMake ExternalProject)
* Supported platforms: Linux, Mac, Windows, iOS

[![Build Status][link_master]][link_hunter]

[link_master]: https://travis-ci.org/ruslo/hunter.png?branch=master
[link_hunter]: https://travis-ci.org/ruslo/hunter

### What is it?

Every hunter release archive is a meta-package with build instructions and URLs of real packages, i.e.:
```
Hunter (0.4.2) = { Boost (1.55.0), GTest (1.7.0), JsonSpirit(0.0.1), OpenSSL(1.0.1h), ... }
```

* Currently used versions can be found in
[cmake/config.cmake](https://github.com/ruslo/hunter/blob/master/cmake/config.cmake) file and are customizable
* Per package versions are available in corresponding `hunter.cmake` file
(e.g. [GTest](https://github.com/ruslo/hunter/blob/master/cmake/projects/GTest/hunter.cmake)).
You can pick one version that already exists
or [add a new one](https://github.com/ruslo/hunter/wiki/Adding-new-package)

### Features

* Automatic dependencies download
 * List of dependencies is a part of cmake code of the project
 * No `emerge`, `apt-get`, `brew` etc. needed before build, now it's simply `cmake --build`
 * Express install instructions in terms of CMake commands instead of raw README text or other script
* Reusable `ExternalProject_Add` recipies ([DRY principle](http://c2.com/cgi/wiki?DontRepeatYourself))
 * Once written formula can be used by other projects, subprojects etc. without copying of collection of
superbuild files. Just change 2 lines of code: SHA1 and URL of hunter archive
* Customizable builds
 * Build 32/64 bit libraries
 * Debug/Release version of libraries
 * Build with different tools like [Clang Memory Sanitizer](http://clang.llvm.org/docs/MemorySanitizer.html)
 * Static/dynamic variant of library
 * ...

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
* [List of variables to control build](https://github.com/ruslo/hunter/wiki/CMake-Variables-%28User%29)
* [How to add a new cmake project](https://github.com/ruslo/hunter/wiki/Adding-new-package)
* [How to add a new custom-build project]
(https://github.com/ruslo/hunter/wiki/Adding-new-package-%28custom-download-scheme%29)
* [Multiple HunterGate commands (e.g. projects subprojects)]
(https://github.com/ruslo/hunter/wiki/Multiple-HunterGate-commands-%28e.g.-projects-subprojects%29)

### iOS note

Install is [broken](http://public.kitware.com/Bug/view.php?id=12506) on iOS.
Patched version of [cmake](https://github.com/ruslo/CMake/releases/tag/v3.0.0-ios-universal) need to be used
(+ install universal libraries instread of one-arch).

### Tagged builds

Each build can be [tagged](https://github.com/ruslo/hunter/wiki/EP_BASE-layout#tagged-layout)
by `HUNTER_INSTALL_TAG` variable. Tags used to differentiate one build from another on one OS. For example on windows you can simultaniously build Visual Studio (32/64), NMake, Cygwin and MinGW projects, on Linux gcc/clang, on Mac Xcode, Makefile, iOS. Or choose different clang tools like static analyzer and sanitizers. Tags designed to be used in cmake [toolchain](https://github.com/ruslo/polly) files. Each toolchain file will be forwarded to external project so if you create toolchain with compiler `g++` and flag `-std=c++11` all dependent projects will be built by `g++ -std=c++11`.

### Uninstall

All directories inside `<HUNTER_ROOT>/_Base` are reconstructible.
You can remove all temps (downloads, unpacked directories, installed directories etc.) by command:
```bash
rm -rf "${HUNTER_ROOT}/_Base"
```
or remove particular snapshot by command:
```bash
rm -rf "${HUNTER_ROOT}/_Base/3a6c66670d-BLABLA-2567c3d44b2a99e288e3c8"
```

### Links
* [Gate to hunter packages](https://github.com/hunter-packages/gate)
* [Simple project example](https://github.com/forexample/hunter-simple)
* [Bigger one](https://github.com/ruslo/weather)
* [Toolchain examples](https://github.com/ruslo/polly)
* [Travis CI build example](https://github.com/forexample/hunter-simple/blob/master/.travis.yml)
