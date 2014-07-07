hunter
======

| mac                                         | linux                                             |
|---------------------------------------------|---------------------------------------------------|
| [![Build Status][link_master]][link_hunter] | [![Build Status][link_travis_linux]][link_hunter] |

[link_master]: https://travis-ci.org/ruslo/hunter.png?branch=master
[link_travis_linux]: https://travis-ci.org/ruslo/hunter.png?branch=travis.linux
[link_hunter]: https://travis-ci.org/ruslo/hunter

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

* That's all, now well known cmake-style kung-fu:
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

### Links
* [Gate to hunter packages](https://github.com/hunter-packages/gate)
* [Simple project example](https://github.com/forexample/hunter-simple)
* [Bigger one](https://github.com/ruslo/weather)
