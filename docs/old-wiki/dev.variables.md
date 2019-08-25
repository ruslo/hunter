# HunterGate.cmake

#### HUNTER_ROOT

* Set by `hunter_gate_detect_root` function (if already defined by user, this variable leaved as is). See [layout of directories](https://github.com/ruslo/hunter/wiki/EP_BASE-layout).

#### HUNTER_ROOT_INFO

* Set by `hunter_gate_detect_root` function

#### HUNTER_URL

* Hunter archive download URL. Set by `HunterGate` macro to current scope and cache if not already set by other `HunterGate`. This variable defined once for the whole project.
See [example]
(https://github.com/ruslo/hunter/wiki/Multiple-HunterGate-commands-%28e.g.-projects-subprojects%29).

#### HUNTER_SHA1

* Hunter archive SHA1. Set by `HunterGate`. Same behaviour as `HUNTER_URL`.

#### HUNTER_BASE

* Set by `HunterGate` (usually `${HUNTER_ROOT}/_Base/${HUNTER_SHA1}`). This is the directory where all packages that belongs to given SHA1 resides. See [layout]
(https://github.com/ruslo/hunter/wiki/EP_BASE-layout).
* This variable is customizable if used without gate, e.g. for testing hunter itself:
```
cmake -H./examples/Sugar/ -B./_builds -DHUNTER_ROOT="`pwd`" -DHUNTER_BASE="`pwd`/_builds/_Base"
```

#### HUNTER_SELF

* Set by `HunterGate` (usually `${HUNTER_BASE}/Self`). Directory with unpacked hunter archive sources. This is the place where master file, config, download schemes, recipies etc. lives.

#### HUNTER_LOCK_PATH

* Synchronization directory. Only one process that successfully create that directory allowed to init `HUNTER_BASE`. Usually `${HUNTER_BASE}/directory-lock`.

#### HUNTER_LOCK_INFO

* Information about locked directory. File with `PROJECT_BINARY_DIR` string. Created by `hunter_gate_try_lock` function. Set to `${HUNTER_LOCK_PATH}/info`.

#### HUNTER_LOCK_FULL_INFO

* Information about locked directory. File with `PROJECT_BINARY_DIR` and timestamp of creation. Created by `hunter_gate_try_lock` function. Set to `${HUNTER_LOCK_PATH}/fullinfo`.

#### HUNTER_GATE_INSTALL_DONE

* Synchronization file. If multiple processes simultaniously try to init `HUNTER_BASE` directory (by `HunterGate` command) only one of them will do it, other will wait until `HUNTER_GATE_INSTALL_DONE` file created. Usually `${HUNTER_BASE}/install-gate-done`.

#### HUNTER_IGNORE_BROKEN_PACKAGE_ERROR

* Ignore error [broken package](https://github.com/ruslo/hunter/wiki/Error-%28broken-package%29). Used to test fixes of broken packages.

#### HUNTER_SKIP_LOCK

* When `HUNTER_SKIP_LOCK` is `TRUE` the locking ignored. This variable is used as a workaround for error ["can't lock"](https://github.com/ruslo/hunter/wiki/error.can.not.lock). 

# cmake/Hunter

#### HUNTER_PACKAGE_DOWNLOAD_DIR

* Directory with downloaded archives. Usually `${HUNTER_BASE}/Download/<package-name>`. Can be customized by user for testing purpose.

# *External*

#### HUNTER_CMAKE_GENERATOR

* Set by [toolchain](https://github.com/ruslo/polly/blob/master/utilities/polly_init.cmake). This generator used for all the projects in superbuild (optimization possible, like `NMake` -> `Visual Studio`)