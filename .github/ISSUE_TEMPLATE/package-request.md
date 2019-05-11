---
name: Package request
about: Leave a package request
title: Add "foo" package
labels: help wanted, new package
assignees: ''

---

* I'm interested in package `<name-of-the-package>`
* Here is the official site of package https://<name-of-the-package.abc>

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
