Package version and extra CMake options can be set in user's `config.cmake` file (see also [how to specify custom config location](https://github.com/hunter-packages/gate#usage-custom-config)).

### Custom package version

```cmake
# CMakeLists.txt
HunterGate(
    URL "https://github.com/ruslo/hunter/archive/v0.8.10.tar.gz"
    SHA1 "9308d01ea52c7b8cf1347073c982c679dbac3c09"
    LOCAL # <----- Use local config.cmake
)
...
hunter_add_package(GTest)
```

```cmake
# cmake/Hunter/config.cmake
hunter_config(GTest VERSION 1.7.0-hunter-9)
hunter_config(ZLIB VERSION 1.2.8-hunter-1)
```

### Custom CMake options

```cmake
# cmake/Hunter/config.cmake
hunter_config(GTest VERSION 1.7.0-hunter-9 CMAKE_ARGS GTEST_SUPER_MODE=ON)
hunter_config(ZLIB VERSION 1.2.8-hunter-1 CMAKE_ARGS ZLIB_FEATURES=FEATURE1;FEATURE2)
```

If you set [HUNTER_STATUS_DEBUG=ON](https://github.com/ruslo/hunter/wiki/usr.variables#hunter_status_debug) you can see that options added to build:
```
-- [hunter *** DEBUG *** 2015-04-20T15:40:12] Add extra CMake args: 'GTEST_SUPER_MODE' = 'ON'
-- [hunter *** DEBUG *** 2015-04-20T15:40:12] Add package: GTest
-- [hunter *** DEBUG *** 2015-04-20T15:40:12] Download scheme: url_sha1_release_debug
-- [hunter *** DEBUG *** 2015-04-20T15:40:12] Url: https://github.com/hunter-packages/gtest/archive/v1.7.0-hunter-9.tar.gz
-- [hunter *** DEBUG *** 2015-04-20T15:40:12] SHA1: 8a47fe9c4e550f4ed0e2c05388dd291a059223d9
```

```
-- [hunter *** DEBUG *** 2015-04-20T15:40:54] Add extra CMake args: 'ZLIB_FEATURES' = 'FEATURE1'
-- [hunter *** DEBUG *** 2015-04-20T15:40:54] Add extra CMake args: 'ZLIB_FEATURES' += 'FEATURE2'
-- [hunter *** DEBUG *** 2015-04-20T15:40:54] Add package: ZLIB
-- [hunter *** DEBUG *** 2015-04-20T15:40:54] Download scheme: url_sha1_release_debug
-- [hunter *** DEBUG *** 2015-04-20T15:40:54] Url: https://github.com/hunter-packages/zlib/archive/v1.2.8-hunter-1.tar.gz
-- [hunter *** DEBUG *** 2015-04-20T15:40:54] SHA1: 24c89e4b193a56bb411fa9878968002ebe2c6209
```

### Order

There are several places where configuration of package can be modified :
* First default global config parsed: `${HUNTER_SELF}/cmake/config/default.cmake`. This file contains only `hunter_config` commands so it will set version, cmake arguments and configuration types of each package
* Then user's local config parsed (e.g. `${CMAKE_CURRENT_LIST_DIR}/cmake/Hunter/config.cmake`). This file can make additional calls to `hunter_config` command and **rewrite** version, cmake arguments and configuration types of package. Note that there is no need to specify all packages that you're planning to use, only packages you want to customize
* Additional arguments can be added in `${HUNTER_SELF}/cmake/project/<package>/hunter.cmake` file using `hunter_cmake_args` and `hunter_configuration_types` command (see [package defaults](https://github.com/ruslo/hunter/wiki/usr.adding.new.package#defaults)). `hunter_cmake_args` will push arguments **to the front** (i.e. with **low** priority). `hunter_configuration_types` will set configuration types only if they are empty (i.e. not set by global default config or local user's config).

Only version field in default global config is mandatory, other fields and user's local config are optional.

#### Example

##### Version

```cmake
# global default ${HUNTER_SELF}/cmake/configs/default.cmake
hunter_package(Foo VERSION 1.2)

# CMakeLists.txt
hunter_add_package(Foo) # default version 1.2 used
```

```cmake
# global default ${HUNTER_SELF}/cmake/configs/default.cmake
hunter_package(Foo VERSION 1.2)

# user's local ${CMAKE_CURRENT_LIST_DIR}/cmake/Hunter/config.cmake
hunter_package(Foo VERSION 2.0)

# CMakeLists.txt
hunter_add_package(Foo) # user's custom version 2.0 used
```

##### Arguments

```cmake
# global default ${HUNTER_SELF}/cmake/configs/default.cmake
hunter_package(Foo VERSION 1.2) # no additional arguments

# user's local ${CMAKE_CURRENT_LIST_DIR}/cmake/Hunter/config.cmake
hunter_package(Foo VERSION 2.0 CMAKE_ARGS FOO_FEATURE=ON)

# CMakeLists.txt
hunter_add_package(Foo) # user's custom version 2.0 + additional FOO_FEATURE=ON used
```

```cmake
# global default ${HUNTER_SELF}/cmake/configs/default.cmake
hunter_package(Foo VERSION 1.2) # no additional arguments

# user's local ${CMAKE_CURRENT_LIST_DIR}/cmake/Hunter/config.cmake
hunter_package(Foo VERSION 2.0 CMAKE_ARGS FOO_FEATURE=ON)

# global default additional cmake arguments from ${HUNTER_SELF}/cmake/projects/Foo/hunter.cmake
hunter_cmake_args(Foo CMAKE_ARGS FOO_WITH_BOO=ON)

# CMakeLists.txt
hunter_add_package(Foo) # user's custom version 2.0 + arguments:
#    * FOO_WITH_BOO=ON from default hunter.cmake
#    * FOO_FEATURE=ON from user's config
```

```cmake
# global default ${HUNTER_SELF}/cmake/configs/default.cmake
hunter_package(Foo VERSION 1.2) # no additional arguments

# user's local ${CMAKE_CURRENT_LIST_DIR}/cmake/Hunter/config.cmake
hunter_package(Foo VERSION 2.0 CMAKE_ARGS FOO_WITH_BOO=OFF)

# global default additional cmake arguments from ${HUNTER_SELF}/cmake/projects/Foo/hunter.cmake
hunter_cmake_args(Foo CMAKE_ARGS FOO_WITH_BOO=ON)

# CMakeLists.txt
hunter_add_package(Foo) # user's custom version 2.0 + arguments:
#    * FOO_WITH_BOO=ON from default hunter.cmake
#    * FOO_WITH_BOO=OFF from user's config
# Since user's config has high priority effectively arguments will be: FOO_WITH_BOO=OFF
```

##### Configuration types

```cmake
# global default ${HUNTER_SELF}/cmake/configs/default.cmake
hunter_package(Foo VERSION 1.2) # no configuration types

# user's local ${CMAKE_CURRENT_LIST_DIR}/cmake/Hunter/config.cmake
hunter_package(Foo VERSION 2.0) # no configuration types

# global default additional cmake arguments from ${HUNTER_SELF}/cmake/projects/Foo/hunter.cmake
hunter_configuration_types(Foo CONFIGURATION_TYPES Debug)

# CMakeLists.txt
hunter_add_package(Foo) # user's custom version 2.0 + default configuration type `Debug` from hunter.cmake
```

```cmake
# global default ${HUNTER_SELF}/cmake/configs/default.cmake
hunter_package(Foo VERSION 1.2) # no configuration types

# user's local ${CMAKE_CURRENT_LIST_DIR}/cmake/Hunter/config.cmake
hunter_package(Foo VERSION 2.0 CONFIGURATION_TYPES Release)

# global default additional cmake arguments from ${HUNTER_SELF}/cmake/projects/Foo/hunter.cmake
hunter_configuration_types(Foo CONFIGURATION_TYPES Debug)

# CMakeLists.txt
hunter_add_package(Foo) # user's custom version 2.0 + configuration type Release from user's config
```

##### Version inheriting

Since default config parsed first you can use variable `HUNTER_<Package>_VERSION` to inherit version:
```cmake
# default config from ${HUNTER_SELF}/cmake/config/default.cmake
hunter_config(Foo VERSION 1.2.3)

# user's local ${CMAKE_CURRENT_LIST_DIR}/cmake/Hunter/config.cmake
hunter_config(Foo VERSION ${HUNTER_Foo_VERSION} CMAKE_ARGS FOO_WITH_BOO=ON)
```

### No effects on CMakeLists.txt

Note that this file configured internally in Hunter. E.g. variable from `config.cmake` will not be visible in CMakeLists.txt:
```cmake
# cmake/Hunter/config.cmake
hunter_config(GTest VERSION 1.7.0-hunter-9 CMAKE_ARGS GTEST_SUPER_MODE=ON)
set(HELLO_FROM_CONFIG "Hello")
```

```cmake
# CMakeLists.txt
HunterGate(...)
message("Config say: '${HELLO_FROM_CONFIG}'")
```

```bash
> cmake -H. -B_builds
Config say: ''
```

### CMake conditions

`config.cmake` is a usual CMake-code file, so such commands like `if` and global variables like `WIN32` can be used:

```cmake
if(WIN32)
  hunter_config(GTest VERSION 1.7.0-hunter-9 CMAKE_ARGS GTEST_SUPER_MODE=ON)
endif()
```

### Links

* [HunterGate](https://github.com/hunter-packages/gate#usage-custom-config)
* [hunter_config](https://github.com/ruslo/hunter/wiki/dev.modules#hunter_config)
* [Custom build types](https://github.com/ruslo/hunter/wiki/example.hunter_configuration_types) (e.g. Release/Debug)