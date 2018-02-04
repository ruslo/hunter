<!--- Use this part of template if you want to start a discussion. Remove the rest. -->
<!--- Alternatively if you have a trivial question you can ask it in Gitter room: https://gitter.im/ruslo/hunter -->
<!--- BEGIN -->

* I've read [Brief overview section](https://docs.hunter.sh/en/latest/overview.html) and do understand basic concepts. **[Yes|No]**
* I've read [F.A.Q. section](https://docs.hunter.sh/en/latest/faq.html) and haven't found an answer to my question. **[Yes|No]**
* I've read [Code of Conduct](https://github.com/ruslo/hunter/blob/master/.github/CODE_OF_CONDUCT.md), I promise to be polite and will do my best at being constructive. **[Yes|No]**

---
<!--- END -->

<!--- Use this part of template if you want to leave a package request. Remove the rest. -->
<!--- BEGIN -->

* I'm interested in package `<name-of-the-package>`
* Here is official site of package https://<name-of-the-package.abc>

<!--- Leave the info about VCS this package is using. Remove this line if there is no any. -->
* This package is using [Git|Mercurial|SVN|...]: https://<name-of-the-package.abc/git>

<!--- Leave the info about availability of this package on GitHub. Remove unused. -->
* Official GitHub repository: https://github.com/<username>/<name-of-the-package>
* Official read-only GitHub mirror: https://github.com/<username>/<name-of-the-package>
* Unofficial GitHub mirror: https://github.com/<username>/<name-of-the-package>

<!--- Leave the info about build system -->
* Used build system: [CMake|autotools|custom|...]

<!--- Even if this package may not use CMake officially -->
<!--- there still may be unofficial/work-in-progress effort to introduce one. -->
<!--- Leave the link if you found one. -->
* Unofficial CMake support: https://github.com/<username>/<name-of-the-package>

<!--- Leave info about dependencies used by package -->
* I have no information about dependencies
* This package has no dependencies
* This package has next dependencies:

  * `<dependency-1>` (required, available in Hunter: https://docs.hunter.sh/en/latest/packages/pkg/<dependency-1>.html)
  * `<dependency-2>` (required, not available in Hunter, corresponding "New package" request: https://github.com/ruslo/hunter/issues/<number>)
  * `<dependency-3>` (optional, not available in Hunter, corresponding "New package" request: https://github.com/ruslo/hunter/issues/<number>)

---
<!--- END -->

<!--- Use this part of template if you want to report bug. Remove the rest. -->
<!--- BEGIN -->

* I've read [Brief overview section](https://docs.hunter.sh/en/latest/overview.html) and do understand basic concepts. **[Yes|No]**
* I've read [F.A.Q. section](https://docs.hunter.sh/en/latest/faq.html) and there is no solution to my problem there. **[Yes|No]**
* I've read [Code of Conduct](https://github.com/ruslo/hunter/blob/master/.github/CODE_OF_CONDUCT.md), I promise to be polite and will do my best at being constructive. **[Yes|No]**
* I've read [Reporting bugs section](https://docs.hunter.sh/en/latest/contributing.html#reporting-bugs) carefully. **[Yes|No]**
* I've checked that all the `hunter_add_package`/`find_package` API used by me in example is the same as in [documentation](https://docs.hunter.sh/en/latest/packages.html). **[Yes|No]**
* I'm using latest Hunter URL/SHA1. **[Yes|No]**

<!--- If you can reproduce an issue using just one small CMakeLists.txt, paste it here. -->
* I've created SSCCE reproducing the issue:
```cmake
# CMakeLists.txt

cmake_minimum_required(VERSION 3.0)

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
<!--- then it's better to create separate GitHub repo with example -->
* I've created SSCCE GitHub repository to reproduce the issue: https://github.com/<username>/<repo>

<!--- Link to CI jobs to reproduce an issue. Optional, but nice to have one. -->
* AppVeyor build reproducing issue: https://ci.appveyor.com/project/<username>/hunter/build/<build-number>
* Travis build reproducing issue: https://travis-ci.org/<username>/hunter/builds/<build-number>

Here is the log until first error reported by Hunter, option `HUNTER_STATUS_DEBUG` is `ON`:
* <link-to-log-file>

<!--- Check this document: https://github.com/ruslo/hunter/wiki/error.external.build.failed -->
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

I'm using next command line on generate step:
```
cmake -H. -B_builds "-GVisual Studio 14 2015"
```

---
<!--- END -->
