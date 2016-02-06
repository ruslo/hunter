Hunter
======

* Cross-platform package manager for C++ (based on CMake [ExternalProject][cmake-external-project])
* Supported platforms: **Linux**, **Mac**, **Windows**, **iOS**, **Android**, **Raspberry Pi**

### CI

* Travis CI OSX/Linux: [![Build Status][travis-master]][travis-hunter]
* AppVeyor CI Windows: [![Build Status][appveyor-master]][appveyor-hunter]
* [Per package deep testing table](https://github.com/ingenue/hunter/branches/all)

### What is it?

Every Hunter [release][hunter-releases] ([Atom feed](https://github.com/ruslo/hunter/releases.atom)) archive is a meta-package with build instructions and URLs of real packages:
```
Hunter (0.4.2) = {
    Boost (1.55.0, 1.56.0, 1.57.0),
    GTest (1.7.0),
    OpenCV (3.0.0-beta, 2.4.11, 2.4.10),
    OpenSSL (1.0.2a, 0.9.8y),
    ...
}
```

* Default build versions can be found in [default.cmake][default-config] file and are customizable (see [Config-ID][config-id])
* Per package versions are available in corresponding `hunter.cmake` file (e.g. [GTest][gtest-hunter]). You can pick one version that already exists or [add a new one][usr.adding.new.package]

### Features

* **Automatic** dependencies download
 * List of dependencies is a part of CMake code of the project
 * No `emerge`, `apt-get`, `brew` etc. needed before build, now it's simply `cmake --build`
 * Express install instructions in terms of CMake commands instead of raw README text or other script
* **Reusable** `ExternalProject_Add` recipies ([DRY principle][dry-principle])
 * Once written formula ([build scheme][build-schemes-dir]) can be used by other projects, subprojects etc. without copying of collection of
superbuild files. Just change 2 lines of code: input parameters `SHA1`/`URL` of HunterGate command
* Several levels of build **customization**:
 * [Hunter-ID][hunter-id] - list of packages and mapping version-url-sha1
 * [Config-ID][config-id] - version of package to build and build options
 * [Toolchain-ID][toolchain-id] - compiler and flags
 * [Build type][hunter-configuration-types] (e.g. Release/Debug)
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

### Notes about version of CMake

* [3.0.0][cmake-3.0.0-release-notes] **Minimum required**
  * **Buggy**, see [PR #198](https://github.com/ruslo/hunter/pull/198#issuecomment-120630877)
  * Interface header-only libraries
  * Sub-option `VERSION` for command `project`
  * New MSVC generator names
* [3.1.0][cmake-3.1.0-release-notes]
  * **Buggy**, see [issue #105](https://github.com/ruslo/hunter/issues/105)
  * Retry download on hash mismatch ([change][cmake-retry-commit])
  * New [CMP0054][cmake-cmp0054] (best CMake policy! See [this SO question][so-cmp0054])
* [3.2.0][cmake-3.2-release-notes]
  * New synchronization command `file(LOCK ...)` ([change][cmake-file-lock-commit])
  * [HUNTER_SKIP_LOCK][error.can.not.lock]
* iOS. Patched (workaround) version of CMake
  * [Latest patched release](https://github.com/ruslo/CMake/releases/tag/v3.4.1-p0)
  * Fix [iOS bug][ios-bug]
  * Create universal (armv7, armv7s, arm64, i386, x86_64) libraries
  * [iOS toolchain][polly-ios-toolchain]

### First step

* Set [HUNTER_ROOT](https://github.com/ruslo/hunter/wiki/usr.variables#hunter_root) environment variable to an empty directory. This directory will be used by `HunterGate` module for storing packages and utility files. Using environment variable is recommended but not mandatory, see [other options][hunter-gate-effects].

* Set minimum CMake version:
```cmake
cmake_minimum_required(VERSION 3.0)
```

* Copy [gate][hunter-gate] module to your project and include it:
```cmake
include("cmake/HunterGate.cmake")
```

* This module will download archive automatically from `URL` that you provide to the `HUNTER_ROOT` directory (it means that there is **no** need to clone this repository in general, see [notes](https://github.com/hunter-packages/gate#notes)):

```cmake
HunterGate(
    URL "https://github.com/ruslo/hunter/archive/v0.10.9.tar.gz"
    SHA1 "53b198e364dc7bc8360fc545f798563229bd7e20"
)
```

* Now project can be started:
```cmake
project(Foo)
```

* Let's download and install `boost.{regex,system,filesystem}`:
```cmake
hunter_add_package(Boost COMPONENTS regex system filesystem)
```

* Hunter part is done, now well known CMake-style kung-fu (see [pkg.boost](https://github.com/ruslo/hunter/wiki/pkg.boost)):
```cmake
find_package(Boost CONFIG REQUIRED regex system filesystem)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC Boost::regex Boost::system Boost::filesystem)
```

* Summarize:
```cmake
cmake_minimum_required(VERSION 3.0)

include("cmake/HunterGate.cmake")
HunterGate(
    URL "https://github.com/ruslo/hunter/archive/v0.10.9.tar.gz"
    SHA1 "53b198e364dc7bc8360fc545f798563229bd7e20"
)

project(Foo)

hunter_add_package(Boost COMPONENTS regex system filesystem)
find_package(Boost CONFIG REQUIRED regex system filesystem)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC Boost::regex Boost::system Boost::filesystem)
```

* Build it:
```
> cmake -H. -B_builds -DHUNTER_STATUS_DEBUG=ON -DCMAKE_BUILD_TYPE=Release
> cmake --build _builds --config Release
```

* [Tiny project with GTest][hunter-simple]

### Usage

* List of packages and usage instructions for each package can be found in [wiki sidebar][hunter-wiki]
* List of global control [variables][usr.variables]
* How to add a new [CMake project][usr.adding.new.package]
* How to add a new [custom-build project][usr.adding.new.package.custom.scheme]
* [Multiple HunterGate][usr.multiple.huntergate] commands (e.g. projects subprojects)

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

* [Releases](https://github.com/ruslo/hunter/releases)

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

* [Example](https://github.com/ruslo/hunter/wiki/example.custom.config.id)

### Toolchain-ID

Third level of customization. Each build can be run with different toolchain. In general the result is completely different root `lib`/`include` directories. For example on Windows you can simultaniously build Visual Studio (32/64), NMake, Cygwin and MinGW projects, on Linux GCC/Clang, on Mac Xcode, Makefile, iOS. Or choose different clang tools like static analyzer/sanitizers and other platforms like Android/Raspberry Pi. Each toolchain file will be forwarded to external project so if you create toolchain with compiler `g++` and flag `-std=c++11` all dependent projects will be built by `g++ -std=c++11`. Information about toolchain has some internal representation (`toolchain.info`) and user can see first 7 digits (ID) of `SHA1` hash of this file.

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

* [Collection of toolchains][polly]
* [Android example](https://github.com/forexample/android-cmake)

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

Feel free to open new [issue][hunter-new-issue] if you want to ask any questions. Also you can write me to `ruslan_baratov@yahoo.com` or contact me using [Tox](https://tox.chat/):
* `7EBD836B7690C3742E6F3632742BEB00283529E06D76E06F7065544A5F9C6F37D948FB0F754B`
* `4EED21EA40B0351D8BFC85A69499A3F7CFEDA6844DA39FF1783A4D9827423F075D7194707C43`

### Contribution

* [Contribution](https://github.com/ruslo/hunter/wiki/dev.contribution)

### Donations

* [Donations](https://github.com/ruslo/hunter/blob/develop/donate.md)

### Links
* [Gate to hunter packages][hunter-gate]
* [Simple project example][hunter-simple]
* [Bigger one](https://github.com/ruslo/weather)
* [Toolchain examples][polly]
* [Travis CI build example](https://github.com/forexample/hunter-simple/blob/master/.travis.yml)

[travis-master]: https://travis-ci.org/ruslo/hunter.svg?branch=master
[travis-hunter]: https://travis-ci.org/ruslo/hunter/builds

[appveyor-master]: https://ci.appveyor.com/api/projects/status/ubo6jse3lh5ciyvv/branch/master?svg=true
[appveyor-hunter]: https://ci.appveyor.com/project/ruslo/hunter/history

[cmake-external-project]: http://www.cmake.org/cmake/help/v3.2/module/ExternalProject.html
[ios-bug]: http://public.kitware.com/Bug/view.php?id=12506
[dry-principle]: http://c2.com/cgi/wiki?DontRepeatYourself

[cmake-retry-commit]: https://github.com/Kitware/CMake/commit/30a94eecdb5c580d83a224848b78d186643e8105
[cmake-file-lock-commit]: https://github.com/Kitware/CMake/commit/e6db4c5a4ede8039ed525e3facebd7e0eb7ec1b7

[cmake-3.0.0-release-notes]: http://www.cmake.org/cmake/help/v3.0/release/3.0.0.html#commands
[cmake-3.1.0-release-notes]: http://www.cmake.org/cmake/help/v3.1/release/3.1.0.html#syntax
[cmake-3.2-release-notes]: http://www.cmake.org/cmake/help/v3.2/release/3.2.html#commands
[cmake-cmp0054]: http://www.cmake.org/cmake/help/v3.1/policy/CMP0054.html

[so-cmp0054]: http://stackoverflow.com/questions/19982340

[hunter-wiki]: https://github.com/ruslo/hunter/wiki
[usr.adding.new.package]: https://github.com/ruslo/hunter/wiki/usr.adding.new.package
[usr.variables-hunter-enabled]: https://github.com/ruslo/hunter/wiki/usr.variables#hunter_enabled
[usr.variables]: https://github.com/ruslo/hunter/wiki/usr.variables
[usr.adding.new.package.custom.scheme]: https://github.com/ruslo/hunter/wiki/usr.adding.new.package.custom.scheme
[usr.multiple.huntergate]: https://github.com/ruslo/hunter/wiki/usr.multiple.huntergate
[dev.variables-hunter-skip-lock]: https://github.com/ruslo/hunter/wiki/dev.variables#hunter_skip_lock
[error.can.not.lock]: https://github.com/ruslo/hunter/wiki/error.can.not.lock
[hunter-configuration-types]: https://github.com/ruslo/hunter/wiki/usr.variables#hunter_configuration_types

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

[polly-ios-toolchain]: https://github.com/ruslo/polly/wiki/Toolchain-list#ios
[polly]: https://github.com/ruslo/polly
[hunter-simple]: https://github.com/forexample/hunter-simple
