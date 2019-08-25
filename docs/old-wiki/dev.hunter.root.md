### Automatic download

As you probably have [noticed][1] there is no need to clone [this][3] repository to use Hunter since all packages will be downloaded automatically by [HunterGate][2] module. The fact that `URL`/`SHA1` arguments used by `HunterGate` can be checked by finding next lines in log:

```
-- [hunter] Initializing Hunter workspace (a98628627c4f4c3ce11ac250fde31a7dbd264a15)
-- [hunter]   /.../hunter.tar.gz
-- [hunter]   -> /.../_Base/Download/Hunter/.../a986286
...
-- [hunter] [ Hunter-ID: a986286 | Config-ID: 496782c | Toolchain-ID: 5a219cb ]
```

Where `hunter-id` is the first 7 digits of `SHA1` of archive (i.e. first 7 digits of `SHA1` argument).

### Git clone

However for development purposes like [adding new package][4] there is git-based functionality in `HunterGate`. Do clone and set [HUNTER_ROOT][5] environment variable:
```bash
> git clone https://github.com/ruslo/hunter
> export HUNTER_ROOT="`pwd`/hunter"
```

In this case `URL`/`SHA1` of `HunterGate` **will not** be used!

Check logs:
```
-- [hunter] [ Hunter-ID: xxxxxxx | Config-ID: 496782c | Toolchain-ID: 5a219cb ]
```

Hence for example you need to do `git pull` to download new changes since modifying `HunterGate` arguments will not have any effects for you (but will have for non-git users, so may be needed too). There are other peculiarities with such approach so probably it make sense to not mix "user" and "development" versions of Hunter. You can achieve this by setting `HUNTER_ROOT` environment variable to an empty directory, do the clone to another one and use `jenkins.py` script for testing (see section below).

### jenkins.py

Using git-based version may be quite tricky for the beginners, have some pitfalls and require basic understanding of how Hunter works. Here are some scenarios:

##### scenario 1
1. Add package `Foo` with version `1.2.3` to Hunter modules
2. Build package `Foo` (`DONE` stamp saved in Hunter working directory `_Base`)
3. Change `URL` of `Foo` package but keep version the same (i.e. `1.2.3`)
4. Run build -> Hunter see `DONE` stamp for version `1.2.3` and doesn't run rebuild!
5. Change both `URL` and version of package Foo (e.g. `1.2.4`)
6. Run build -> Hunter don't see `DONE` stamp for version `1.2.4`, build Foo and save new `DONE` stamp

##### scenario 2
1. Build [cacheable][6] package `Foo` -> Hunter save `DONE` stamp and `*.tar.gz` archive with packed installated files
2. Change internal files like schemes or other CMake modules which should update build instructions of `Foo`
3. Run build -> Hunter see `DONE` stamp for `Foo` and will do nothing
4. Remove `DONE` stamp
5. Run build -> Hunter don't see `DONE` stamp but found `*.tar.gz` in cache so will just unpack archive without triggering build (your updates not applied!)
6. Remove `DONE` stamp and metadata from Cache
7. Run build -> Hunter will rebuild `Foo` with new instructions

To avoid such problems script `jenkins.py` can be used. This script will pack current Hunter directory and run build instructions for project specified by `PROJECT_DIR` environment variable. Note that this script will create his own `HUNTER_ROOT` directory (i.e. environment variable `HUNTER_ROOT` will not be used):
```bash
# check you have python3
> python3 --version
Python 3.4.3

# download build.py script
> git clone https://github.com/ruslo/polly
> export PATH="`pwd`/polly/bin:$PATH"
> which build.py
/.../polly/bin/build.py

# clone Hunter repository
> git clone https://github.com/ruslo/hunter
> cd hunter

# run build for some package, like GTest
# environment variable TOOLCHAIN will be used as an argument for `build.py --toolchain`
[hunter]> TOOLCHAIN=default PROJECT_DIR=examples/GTest ./jenkins.py --verbose

# script will pack current archive in `_testing` directory
-- [hunter] Initializing Hunter workspace (f0550216489047a310a27c2b5ac95c70e7e878bf)
-- [hunter]   /.../hunter/_testing/hunter.tar.gz
-- [hunter]   -> /.../_testing/Hunter/_Base/Download/Hunter/unknown/f055021
```

About `build.py` and toolchains: [link](https://github.com/ruslo/polly#buildpy)

See `jenkins.py --help` for more options:
* `--nocreate` will not pack new Hunter archive but reuse old one (`_testing/hunter.tar.gz`). This may be useful for testing several packages one-by-one. Also it means that any new changes in Hunter internal modules will not be used.
* `--clear` remove **all** testing directories, i.e. `_testing` directory
* `--clear-except-download` remove `_Base/<hunter-id>` and `_Base/Cache` directories but keep `_Base/Download`. This may be helpful for doing cleanup but will save archives with sources for future testing. Note that there is no need to enter full option name, i.e. `./jenkins.py --clear-except` will work fine too

[1]: https://github.com/ruslo/hunter#first-step
[2]: https://github.com/hunter-packages/gate
[3]: https://github.com/ruslo/hunter
[4]: https://github.com/ruslo/hunter/wiki/usr.adding.new.package
[5]: https://github.com/hunter-packages/gate#effects
[6]: https://github.com/ruslo/hunter/wiki/dev.modules#hunter_cacheable