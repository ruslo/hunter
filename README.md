Hunter
======

* Cross-platform package manager for C++ (based on CMake [ExternalProject][cmake-external-project])
* Supported platforms: Linux, Mac, Windows, iOS

[![Build Status][travis-master]][travis-hunter]

### What is it?

Every Hunter [release][hunter-releases] archive is a meta-package with build instructions and URLs of real packages:
```
Hunter (0.4.2) = {
    Boost (1.55.0, 1.56.0, 1.57.0),
    GTest (1.7.0),
    OpenCV(3.0.0-beta, 2.4.11, 2.4.10),
    OpenSSL (1.0.2a, 0.9.8y),
    ...
}
```

* Default versions can be found in [default.cmake][default-config] file and are customizable (see [Config-ID][config-id])
* Per package versions are available in corresponding `hunter.cmake` file (e.g. [GTest][gtest-hunter]). You can pick one version that already exists or [add a new one][usr.adding.new.package]

### Features

* **Automatic** dependencies download
 * List of dependencies is a part of CMake code of the project
 * No `emerge`, `apt-get`, `brew` etc. needed before build, now it's simply `cmake --build`
 * Express install instructions in terms of CMake commands instead of raw README text or other script
* **Reusable** `ExternalProject_Add` recipies ([DRY principle][dry-principle])
 * Once written formula ([build scheme][build-schemes-dir]) can be used by other projects, subprojects etc. without copying of collection of
superbuild files. Just change 2 lines of code: input parameters `SHA1`/`URL` of HunterGate command
* Three level of **customization** of root directory (+ Debug/Release builds):
 * [Hunter-ID][hunter-id] - list of packages and mapping version-url-sha1
 * [Config-ID][config-id] - version of package to build and build options
 * [Toolchain-ID][toolchain-id] - compiler and flags
* **Shareable** root directory with build synchronization
 * Any number of projects can use root directory and add new packages simultaneously
* Manage **anything** that can be downloaded by `URL` and checked with `SHA1` hash:
 * C++ packages
 * CMake modules
 * Additional sources
 * Resources (pictures, data for testing, ...)
* Backward **compatibility**. Turn Hunter off by adding one option [HUNTER_ENABLED=OFF][usr.variables-hunter-enabled] to use your old settings
* No other dependencies - **just CMake** and your environment/IDE (no need for Git or Python or anything)
* Works **everywhere**: CMake-GUI, Qt Creator, Visual Studio, Xcode, Cygwin, MinGW, Jenkins, Travis etc.

### First step

* Set `HUNTER_ROOT` environment variable (recommended but not mandatory, see 
[other options][hunter-gate-effects])

* Copy [gate][hunter-gate] module to your project and include it:
```cmake
include("cmake/HunterGate.cmake")
```

* This module will download archive automatically from `URL` that you provide:

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

* That's all. And now well known CMake-style kung-fu:
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

* List of packages and usage instructions for each package can be found in [wiki sidebar][hunter-wiki]
* List of global control [variables][usr.variables]
* How to add a new [CMake project][usr.adding.new.package]
* How to add a new [custom-build project][usr.adding.new.package.custom.scheme]
* [Multiple HunterGate][usr.multiple.huntergate] commands (e.g. projects subprojects)

### iOS note

Install is [broken][ios-bug] on iOS. Patched version of [CMake][cmake-patched-releases] need to be used (fix install + create universal [armv7, armv7s, arm64, i386, x86_64] libraries).

### Hunter-ID

First level of customization. Hunter-ID is the first 7 digits of `SHA1` of Hunter archive. I.e. each Hunter-ID contains list of projects that you can build and list of versions. Each version has it's unique `URL` and `SHA1`. Several Hunter-ID can coexists in same `HUNTER_ROOT` directory. `HunterGate` command will control your choice:

* `1eae623`
 * Hunter `0.8.3`
 * `Foo 1.0.0` -> `http://mysite.com/Foo-1.0.0.tar.gz`
 * `Boo 2.0.0` -> `http://mysite.com/Boo-2.0.0.tar.gz`
 * `Roo 1.2.3` -> `http://mysite.com/Roo-1.2.3.tar.gz`
 * -> `${HUNTER_ROOT}/_Base/1eae623/...`
* `e07a124`
 * Hunter `0.8.4`
 * `Awesome 1.0.0` -> `http://example.com/Awesome-1.0.0.tar.gz`
 * `Best 2.0.0` -> `http://example.com/Best-2.0.0.tar.gz`
 * `Foo 1.0.0` -> `http://example.com/Foo-1.0.0-patch-1.tar.gz` # yep, different URL/SHA1
 * -> `${HUNTER_ROOT}/_Base/e07a124/...`

Message in logs:
```cmake
-- [hunter] [ Hunter-ID: 1eae623 | Config-ID: ... | Toolchain-ID: ... ]
-- [hunter] [ Hunter-ID: e07a124 | Config-ID: ... | Toolchain-ID: ... ]
```

### Config-ID

Second level of customization. Config-ID is the first 7 digits of `SHA1` of the file with `hunter_config` commands (internal unified representation). This level can be customized with `HunterGate` [options][hunter-gate-custom-config]: `GLOBAL`, `LOCAL` and `FILEPATH`. Same `Hunter-ID` can be built with different versions of packages and different CMake arguments:

* `0fa873a`
 * `Foo 1.0.0`
 * `Boo 2.0.0` with option `BOO_WITH_SOMETHING=YES`
 * -> `${HUNTER_ROOT}/_Base/1eae623/0fa873a`
* `e9da39c`
 * `Foo 2.1.0` with option `FOO_SUPER_MODE=YES`
 * `Boo 3.0.0` with option `BUILD_SHARED_LIBS=ON`
 * -> `${HUNTER_ROOT}/_Base/1eae623/e9da39c`

Message in logs:
```cmake
-- [hunter] [ Hunter-ID: 1eae623 | Config-ID: 0fa873a | Toolchain-ID: ... ]
-- [hunter] [ Hunter-ID: 1eae623 | Config-ID: e9da39c | Toolchain-ID: ... ]
```

### Toolchain-ID

Third level of customization. Each build can be run with different toolchain. In general the result is completely different root `lib`/`include` directories. For example on Windows you can simultaniously build Visual Studio (32/64), NMake, Cygwin and MinGW projects, on Linux GCC/Clang, on Mac Xcode, Makefile, iOS. Or choose different clang tools like static analyzer and sanitizers. Each toolchain file will be forwarded to external project so if you create toolchain with compiler `g++` and flag `-std=c++11` all dependent projects will be built by `g++ -std=c++11`. Information about toolchain has some internal representation (`toolchain.info`) and user can see first 7 digits (ID) of `SHA1` hash of this file.

* `d46ea0b`
 * `gcc`
 * -> `${HUNTER_ROOT}/_Base/1eae623/0fa873a/d46ea0b`
* `c018e63`
 * `clang`
 * -> `${HUNTER_ROOT}/_Base/1eae623/0fa873a/c018e63`
* `c39da39`
 * `clang -std=c++11`
 * -> `${HUNTER_ROOT}/_Base/1eae623/0fa873a/c39da39`

Message in logs:
```
-- [hunter] [ Hunter-ID: 1eae623 | Config-ID: 0fa873a | Toolchain-ID: d46ea0b ]
-- [hunter] [ Hunter-ID: 1eae623 | Config-ID: 0fa873a | Toolchain-ID: c018e63 ]
-- [hunter] [ Hunter-ID: 1eae623 | Config-ID: 0fa873a | Toolchain-ID: c39da39 ]
```

### Uninstall

All directories inside `${HUNTER_ROOT}/_Base` are reconstructible. You can remove all temps (downloads, unpacked directories, installed directories etc.) by command:
```bash
rm -rf "${HUNTER_ROOT}/_Base"
```
or remove particular Hunter-ID by command:
```bash
rm -rf "${HUNTER_ROOT}/_Base/62422b8" # remove installed libraries
rm -rf "${HUNTER_ROOT}/_Base/Download/Hunter/0.8.3/62422b8" # remove Hunter itself
```

### Questions?

Feel free to open new [issue][hunter-new-issue] if you want to ask any questions.

### Contribution

Read [wiki][hunter-wiki] before making changes. Please send a patch as a pull request against the branch [develop][hunter-dev-branch]. After successfull build this branch will be merged to [master][hunter-master-branch] automatically.

### Links
* [Gate to hunter packages][hunter-gate]
* [Simple project example](https://github.com/forexample/hunter-simple)
* [Bigger one](https://github.com/ruslo/weather)
* [Toolchain examples](https://github.com/ruslo/polly)
* [Travis CI build example](https://github.com/forexample/hunter-simple/blob/master/.travis.yml)

[travis-master]: https://travis-ci.org/ruslo/hunter.png?branch=master
[travis-hunter]: https://travis-ci.org/ruslo/hunter

[cmake-external-project]: http://www.cmake.org/cmake/help/v3.2/module/ExternalProject.html
[ios-bug]: http://public.kitware.com/Bug/view.php?id=12506
[dry-principle]: http://c2.com/cgi/wiki?DontRepeatYourself

[cmake-patched-releases]: https://github.com/ruslo/CMake/releases

[hunter-wiki]: https://github.com/ruslo/hunter/wiki
[usr.adding.new.package]: https://github.com/ruslo/hunter/wiki/usr.adding.new.package
[usr.variables-hunter-enabled]: https://github.com/ruslo/hunter/wiki/usr.variables#hunter_enabled
[usr.variables]: https://github.com/ruslo/hunter/wiki/usr.variables
[usr.adding.new.package.custom.scheme]: https://github.com/ruslo/hunter/wiki/usr.adding.new.package.custom.scheme
[usr.multiple.huntergate]: https://github.com/ruslo/hunter/wiki/usr.multiple.huntergate

[hunter-new-issue]: https://github.com/ruslo/hunter/issues/new

[hunter-master-branch]: https://github.com/ruslo/hunter/tree/master
[hunter-dev-branch]: https://github.com/ruslo/hunter/tree/develop
[default-config]: https://github.com/ruslo/hunter/blob/master/cmake/configs/default.cmake
[hunter-releases]: https://github.com/ruslo/hunter/releases
[gtest-hunter]: https://github.com/ruslo/hunter/blob/master/cmake/projects/GTest/hunter.cmake
[build-schemes-dir]: https://github.com/ruslo/hunter/tree/master/cmake/schemes

[hunter-id]: https://github.com/ruslo/hunter/tree/develop#hunter-id
[config-id]: https://github.com/ruslo/hunter/tree/develop#config-id
[toolchain-id]: https://github.com/ruslo/hunter/tree/develop#toolchain-id

[hunter-gate]: https://github.com/hunter-packages/gate
[hunter-gate-effects]: https://github.com/hunter-packages/gate#effects
[hunter-gate-custom-config]: https://github.com/hunter-packages/gate#usage-custom-config
