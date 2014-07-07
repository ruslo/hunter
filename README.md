Hunter
======

* Cross-platform package manager for CMake (based on ExternalProject)
* Supported platforms: Linux, Mac, Windows, iOS

### Travis CI

| mac                                         | linux                                             |
|---------------------------------------------|---------------------------------------------------|
| [![Build Status][link_master]][link_hunter] | [![Build Status][link_travis_linux]][link_hunter] |

[link_master]: https://travis-ci.org/ruslo/hunter.png?branch=master
[link_travis_linux]: https://travis-ci.org/ruslo/hunter.png?branch=travis.linux
[link_hunter]: https://travis-ci.org/ruslo/hunter

### What is it?

Every hunter release archive is a meta-package, i.e.:
```
Hunter (0.4.2) = { Boost (1.55.0), GTest (1.7.0), JsonSpirit(0.0.1), OpenSSL(1.0.1h), ... }
```

* Current used versions can be found in
[cmake/config.cmake](https://github.com/ruslo/hunter/blob/master/cmake/config.cmake) file
* Per package versions are available in corresponding `hunter.cmake` file
(e.g. [GTest](https://github.com/ruslo/hunter/blob/master/cmake/projects/GTest/hunter.cmake))
You can pick one version that already exists
or [add a new one](https://github.com/ruslo/hunter/wiki/Adding-new-package).

### Usage

* Set `HUNTER_ROOT` environment variable (recommended but not mandatory, see 
[other options](https://github.com/hunter-packages/gate#effects)).

* Copy [gate](https://github.com/hunter-packages/gate) module to your project and include it:
```cmake
include("cmake/HunterGate.cmake")
```

* This module will download archive automatically from URL that you provide:

```cmake
HunterGate(
    URL "https://github.com/path/to/hunter/archive.tar.gz"
    SHA1 "sha1-hash-of-archive"
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
