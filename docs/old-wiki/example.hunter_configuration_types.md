You got full control over what build type (Release/Debug) will be used while building your 3rd party packages.

### HUNTER_CONFIGURATION_TYPES (global)

Set [HUNTER_CONFIGURATION_TYPES][hunter-configuration-types] CMake variable to specify the list of build types to use while building **all** packages. Default value is `Release` + `Debug`:
```bash
> cmake -H. -B_builds -DHUNTER_STATUS_DEBUG=ON
...
-- [hunter *** DEBUG *** 2015-04-22T12:05:34] HUNTER_CONFIGURATION_TYPES: Release;Debug
```

Set your option via command line:
```bash
> cmake -H. -B_builds -DHUNTER_STATUS_DEBUG=ON -DHUNTER_CONFIGURATION_TYPES=SuperRelease
...
-- [hunter *** DEBUG *** 2015-04-22T12:08:56] HUNTER_CONFIGURATION_TYPES: SuperRelease
```

Note that `HUNTER_CONFIGURATION_TYPES` now is in CMake cache, so if you run this configure again variable will be used from cache even if it's not set by user:
```bash
> cmake -H. -B_builds -DHUNTER_STATUS_DEBUG=ON
...
-- [hunter *** DEBUG *** 2015-04-22T12:11:22] HUNTER_CONFIGURATION_TYPES: SuperRelease
```
```bash
> grep HUNTER_CONFIGURATION_TYPES _builds/CMakeCache.txt
HUNTER_CONFIGURATION_TYPES:STRING=SuperRelease
```

You can remove cache to use defaults:
```bash
> rm _builds/CMakeCache.txt
> cmake -H. -B_builds -DHUNTER_STATUS_DEBUG=ON
...
-- [hunter *** DEBUG *** 2015-04-22T12:13:28] HUNTER_CONFIGURATION_TYPES: Release;Debug
```

Or using `-U` option:
```bash
> rm -rf _builds
> cmake -H. -B_builds -DHUNTER_STATUS_DEBUG=ON -DHUNTER_CONFIGURATION_TYPES=SuperRelease
...
-- [hunter *** DEBUG *** 2015-04-22T12:16:04] HUNTER_CONFIGURATION_TYPES: SuperRelease
```
```bash
> cmake -H. -B_builds -DHUNTER_STATUS_DEBUG=ON
...
-- [hunter *** DEBUG *** 2015-04-22T12:16:43] HUNTER_CONFIGURATION_TYPES: SuperRelease
```
```bash
> cmake -H. -B_builds -DHUNTER_STATUS_DEBUG=ON -UHUNTER_CONFIGURATION_TYPES
...
-- [hunter *** DEBUG *** 2015-04-22T12:17:32] HUNTER_CONFIGURATION_TYPES: Release;Debug
```

*See CMake [documentation](http://www.cmake.org/cmake/help/v3.2/command/set.html) about variables' types.*

Also you can set this option to your `CMakeLists.txt` (do it **before** command `HunterGate`):
```cmake
# CMakeLists.txt
set(HUNTER_CONFIGURATION_TYPES MyRelease SuperDebug)
HunterGate(...)
```

```bash
> cmake -H. -B_builds -DHUNTER_STATUS_DEBUG=ON
...
-- [hunter *** DEBUG *** 2015-04-22T12:25:22] HUNTER_CONFIGURATION_TYPES: MyRelease;SuperDebug
```

### Per package

You can customize package using `hunter_config` command (see also other [customizations](https://github.com/ruslo/hunter/wiki/example.custom.config.id)):

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
hunter_config(GTest VERSION 1.7.0-hunter-9 CONFIGURATION_TYPES Release Debug)
hunter_config(ZLIB VERSION 1.2.8-hunter-1 CONFIGURATION_TYPES Release SuperRelease)
```

### Links

* [CMAKE_BUILD_TYPE](http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_BUILD_TYPE.html)
* [CMAKE_CONFIGURATION_TYPES](http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_CONFIGURATION_TYPES.html)
* [Difference between CMAKE_BUILD_TYPE and CMAKE_CONFIGURATION_TYPES](http://stackoverflow.com/a/24470998/2288008)

[hunter-configuration-types]: https://github.com/ruslo/hunter/wiki/usr.variables#hunter_configuration_types