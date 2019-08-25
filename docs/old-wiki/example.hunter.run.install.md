Example to show the usefulness of [HUNTER_RUN_INSTALL](https://github.com/ruslo/hunter/wiki/usr.variables#hunter_run_install) option.

#### Example 1
Assume you usually use `/home/username/tools/hunter` directory to install packages by specifying `HUNTER_ROOT` environment variable. Lets guess one time for any reason this variable is accidentially empty. Hunter will report this error while trying to find master file in default `/home/username/.hunter` location and when nothing found it will offer you to run auto-install explicitly:
```bash
> echo $HUNTER_ROOT

# ooops, something wrong - nothing in output
> cmake -H. -B_builds
[hunter ** FATAL ERROR **] Hunter not found in '/home/username/.hunter/_Base/Download/Hunter/0.8.3/1eae623'
[hunter ** FATAL ERROR **] Set HUNTER_RUN_INSTALL=ON to auto-install it from 'https://.../v0.8.3.tar.gz'
[hunter ** FATAL ERROR **] Settings:
[hunter ** FATAL ERROR **]   HUNTER_ROOT: /home/username/.hunter
[hunter ** FATAL ERROR **]   HUNTER_SHA1: 1eae623cb5ce9da39c8c3e1b0f6e452f244ddc17
```

#### Example 2
Guess you want to remove old Hunter version `0.8.2`/`353b0b89bb838b9437a1082aa708b1ab7b3ab77b` from `HUNTER_ROOT` completely and use `0.8.3`/`1eae623cb5ce9da39c8c3e1b0f6e452f244ddc17` in every package (note that in general you can use both versions simultaneously without any limitations):
```bash
> rm -rf $HUNTER_ROOT/_Base/353b0b8 # Remove installed packages
> rm -rf $HUNTER_ROOT/_Base/Download/Hunter/0.8.2/353b0b8 # Remove Hunter archive
> grep SHA1 CMakeLists.txt # project with new 0.8.3
    SHA1 "1eae623cb5ce9da39c8c3e1b0f6e452f244ddc17"
> cmake -H. -B_builds -DHUNTER_RUN_INSTALL=ON
-- [hunter] Initializing Hunter workspace (1eae623cb5ce9da39c8c3e1b0f6e452f244ddc17)
-- [hunter]   https://.../v0.8.3.tar.gz
-- [hunter]   -> /.../_Base/Download/Hunter/0.8.3/1eae623
```

Guess you forget to update one project and it still using `0.8.2`. Instead of silently install all packages to `HUNTER_ROOT` the error will be reported:
```bash
> grep SHA1 CMakeLists.txt # ooops, old version 0.8.2!
    SHA1 "353b0b89bb838b9437a1082aa708b1ab7b3ab77b"
> cmake -H. -B_builds
[hunter ** FATAL ERROR **] Hunter not found in '/.../_Base/Download/Hunter/0.8.2/353b0b8'
[hunter ** FATAL ERROR **] Set HUNTER_RUN_INSTALL=ON to auto-install it from 'https://.../v0.8.2.tar.gz'
[hunter ** FATAL ERROR **] Settings:
[hunter ** FATAL ERROR **]   HUNTER_ROOT: /.../
[hunter ** FATAL ERROR **]   HUNTER_SHA1: 353b0b89bb838b9437a1082aa708b1ab7b3ab77b
```