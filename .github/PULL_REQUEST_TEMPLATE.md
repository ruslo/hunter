<!--- Use this part of template if you're adding new package. Remove the rest. -->
<!--- BEGIN -->

* I've followed [this guide](https://docs.hunter.sh/en/latest/creating-new/create/cmake.html)
  step by step carefully. **[Yes|No]**

* I've tested this package remotely and have excluded all broken builds.
  Here is the links to the Travis/AppVeyor with status "All passed":

  * https://ci.appveyor.com/project/<username>/hunter/build/<build-number>
  * https://travis-ci.org/<username>/hunter/builds/<build-number>

* I have submitted CI configs to https://github.com/ingenue/hunter targeting `pkg.template` branch,
  see this merged pull request https://github.com/ingenue/hunter/pull/<number>

<!--- Remove next line if there is no corresponding "New package" issue. -->
* My change will resolve this "New package" request: https://github.com/ruslo/hunter/issues/<number>

---
<!--- END -->

<!--- Use this part of template if you're updating existing package. Remove the rest. -->
<!--- BEGIN -->

* I've tested this package remotely and have excluded all broken builds.
  Here is the links to the Travis/AppVeyor with status "All passed":

  * https://ci.appveyor.com/project/<username>/hunter/build/<build-number>
  * https://travis-ci.org/<username>/hunter/builds/<build-number>

<!--- Remove next line if this update doesn't break old toolchains -->
* This update will break few old toolchains.
  They are excluded in this pull request: https://github.com/ingenue/hunter/pull/<number>

---
<!--- END -->

<!--- Use this part of template for other type of changes. Remove the rest. -->
<!--- BEGIN -->

* I've checked this [Git style guide](https://0.readthedocs.io/en/latest/git.html). **[Yes|No]**
* I've checked this [CMake style guide](https://0.readthedocs.io/en/latest/cmake.html). **[Yes|No]**
* My change will work with CMake 3.0 (minimum requirement for Hunter). **[Yes|No]**
* I will try to keep this pull request as small as possible and will try not to mix unrelated features. **[Yes|No]**

---
<!--- END -->
