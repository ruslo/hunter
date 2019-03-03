---
name: Bug report
about: Create a report to help us improve
title: ''
labels: ''
assignees: ''

---

* I've read [Brief overview section](https://docs.hunter.sh/en/latest/overview.html) and do understand basic concepts. **[Yes|No]**
* I've read [F.A.Q. section](https://docs.hunter.sh/en/latest/faq.html) and there is no solution to my problem there. **[Yes|No]**
* I've read [Code of Conduct](https://github.com/ruslo/hunter/blob/master/.github/CODE_OF_CONDUCT.md), I promise to be polite and will do my best at being constructive. **[Yes|No]**
* I've read [Reporting bugs section](https://docs.hunter.sh/en/latest/contributing.html#reporting-bugs) carefully. **[Yes|No]**
* I've checked that all the `hunter_add_package`/`find_package` API used by me in the example is the same as in [documentation](https://docs.hunter.sh/en/latest/packages.html). **[Yes|No]**
* I'm using [latest](https://github.com/ruslo/hunter/releases) Hunter `URL`/`SHA1`. **[Yes|No]**

<!--- If you can reproduce an issue using just one small CMakeLists.txt, paste it here. -->
* I've created [SSCCE](http://www.sscce.org/) reproducing the issue:
```cmake
# CMakeLists.txt

cmake_minimum_required(VERSION 3.2)

include("cmake/HunterGate.cmake")
HunterGate(
    URL "..."
    SHA1 "..."
)

project(foo)

hunter_add_package(boo)
find_package(boo CONFIG REQUIRED)
```

<!--- If it's not just one file and you have to add more CMakeLists.txt or some C++ sources -->
<!--- then it's better to create separate GitHub repo with an example -->
* I've created [SSCCE](http://www.sscce.org/) GitHub repository to reproduce the issue:
  - https://github.com/<username>/<repo>

<!--- Link to CI jobs to reproduce an issue. Optional, but nice to have one. -->
* AppVeyor build reproducing issue:
  - https://ci.appveyor.com/project/<username>/hunter/build/<build-number>
* Travis build reproducing issue:
  - https://travis-ci.org/<username>/hunter/builds/<build-number>

Here is the log until first error reported by Hunter, option `HUNTER_STATUS_DEBUG` is `ON`:
* <link-to-log-file>

<!--- Check this document: https://docs.hunter.sh/en/latest/reference/errors/error.external.build.failed.html -->
<!--- If you got `external.build.failed` -->
I've checked that the first error in logs **IS NOT** `external.build.failed`. **[Yes|No]**

<!--- Info about environment -->
* I'm building on [Linux|OSX|Windows|...].
* [I'm using system CMake|I'm using official CMake release|I've built CMake from sources myself]
* CMake version: <X.Y.Z>

<!--- What toolchain you're using if any -->
* I'm not using toolchain
* I'm using unmodified toolchain <toolchain-name> from [Polly](https://github.com/ruslo/polly)
* I've patched toolchain <toolchain-name> from [Polly](https://github.com/ruslo/polly). Here is my patch: https://github.com/<username>/polly
* I'm using my toolchain: https://github.com/<username>/<repo-with-toolchain>

I'm using the next command line on generate step:
```
cmake -H. -B_builds "-GVisual Studio 14 2015"
```

---
