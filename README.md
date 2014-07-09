Hunter
======

* Cross-platform package manager for CMake (based on ExternalProject)
* Supported platforms: Linux, Mac, Windows, iOS

[![Build Status][link_master]][link_hunter]

[link_master]: https://travis-ci.org/ruslo/hunter.png?branch=master
[link_hunter]: https://travis-ci.org/ruslo/hunter

### What is it?

Every hunter release archive is a meta-package, i.e.:
```
Hunter (0.4.2) = { Boost (1.55.0), GTest (1.7.0), JsonSpirit(0.0.1), OpenSSL(1.0.1h), ... }
```

* Currently used versions can be found in
[cmake/config.cmake](https://github.com/ruslo/hunter/blob/master/cmake/config.cmake) file
* Per package versions are available in corresponding `hunter.cmake` file
(e.g. [GTest](https://github.com/ruslo/hunter/blob/master/cmake/projects/GTest/hunter.cmake)).
You can pick one version that already exists
or [add a new one](https://github.com/ruslo/hunter/wiki/Adding-new-package)

### Usage

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

### Tagged builds

Each build can be [tagged](https://github.com/ruslo/hunter/wiki/EP_BASE-layout#tagged-layout)
by `HUNTER_INSTALL_TAG` variable. Tags used to differentiate one build from another on one OS. For example on windows you can simultaniously build Visual Studio, NMake, Cygwin and MinGW projects, on Linux gcc/clang, on Mac Xcode, Makefile, iOS. Or choose different clang tools like static analyzer and sanitizers. Tags designed to be used in cmake [toolchain](https://github.com/ruslo/polly) files. Each toolchain file will be forwarded to external project so if you create toolchain with compiler `g++` and flag `-std=c++11` all dependent projects will be built by `g++ -std=c++11`.

### How to update?

There is no such thing as update here. If you create a new version
(meta-version, i.e. snapshot of different packages' versions)
then you will build all of them from scratch
([see rationale](https://github.com/ruslo/hunter/wiki/Rationale)).

* **Cons** Big one and kind of obvious - it can take a long time to compile, not for every-day update
* **Pros** One versions of all packages independently on all platforms
* **Pros** You can use different meta-versions simultaniously (which is really usefull in CI testing). E.g.:
```
<HUNTER_ROOT>/_Base/3a6c66670d-BLABLA-2567c3d44b2a99e288e3c8 # Boost 1.55 + OpenSSL 0.9.8 + GTest 1.6
<HUNTER_ROOT>/_Base/f46f105449-BLABLA-9f866237038b70d03ebcc8 # Boost 1.53 + OpenSSL 1.0.1h + GTest 1.7
```

So put a **stable** releases inside `config.cmake` and something like submodules for everything else.

### Tutorial

* [Add cmake project](https://github.com/ruslo/hunter/wiki/Adding-new-package)
* [Add custom-build project](https://github.com/ruslo/hunter/wiki/Adding-new-package-%28custom-download-scheme%29)

### Links
* [Gate to hunter packages](https://github.com/hunter-packages/gate)
* [Simple project example](https://github.com/forexample/hunter-simple)
* [Bigger one](https://github.com/ruslo/weather)
* [Toolchain examples](https://github.com/ruslo/polly)
* [Travic CI build example](https://github.com/forexample/hunter-simple/blob/master/.travis.yml)
