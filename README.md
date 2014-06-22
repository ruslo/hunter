hunter
======

| mac                                         | linux                                             |
|---------------------------------------------|---------------------------------------------------|
| [![Build Status][link_master]][link_hunter] | [![Build Status][link_travis_linux]][link_hunter] |

[link_master]: https://travis-ci.org/ruslo/hunter.png?branch=master
[link_travis_linux]: https://travis-ci.org/ruslo/hunter.png?branch=travis.linux
[link_hunter]: https://travis-ci.org/ruslo/hunter

### Usage
```bash
> cat CMakeLists.txt
cmake_minimum_required(VERSION 2.8.10)
project(Foo)

include(HunterGate.cmake)
hunter_add_package(Boost COMPONENTS regex filesystem)

find_package(Boost REQUIRED regex filesystem)

include_directories(${Boost_INCLUDE_DIR})
add_executable(foo foo.cpp)
target_link_libraries(foo ${Boost_LIBRARIES})
> echo ${HUNTER_ROOT} # not necessary but recommended (otherwise boost will be downloaded to default directory)
/path/to/the/hunter/base/directory
> cmake -H. -B_builds -DHUNTER_STATUS_DEBUG=ON
```

Gate to hunter packages: https://github.com/hunter-packages/gate

### Project example (simple)

* https://github.com/forexample/hunter-simple

### Project example (realistic)

* https://github.com/ruslo/weather
