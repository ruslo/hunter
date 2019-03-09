<!--- Please check that your pull request satisfy all requirements -->

* I have checked that this pull request contains only
  `.travis.yml`/`appveyor.yml` changes or commits merged from the `pkg.template` branch. All other changes send
  to https://github.com/ruslo/hunter. **[Yes|No]**

* I have checked that no toolchains removed from CI configs, they are commented
  out instead so other developers can enable them back easily and to simplify
  merge conflict resolution. **[Yes|No]**

* I have checked that for every commented out toolchain there is a link to the
  broken CI build page or to the minimum compiler requirements documentation
  so other developers can figure out what was the problem exactly. **[Yes|No]**

<!--- Remove next line if this pull request is part of procedure of adding new package -->
* I have checked that for every enabled toolchain corresponding package passed
  all stages of update cycle: test/merge/upload/release. **[Yes|No]**
