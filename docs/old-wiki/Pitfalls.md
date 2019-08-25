#### file DOWNLOAD HASH mismatch

Build failed with next message:
```
    for file: [/.../_3rdParty/Download/OpenSSL_1_0_1e.tar.gz]
      expected hash: [4e8e2b21899f0dab567def50680dfd02a7acbb1a]
        actual hash: [da39a3ee5e6b4b0d3255bfef95601890afd80709]
```

Something went wrong. `da39...` is a hash of an empty file:
```bash
> touch x
> openssl sha1 x
SHA1(x)= da39a3ee5e6b4b0d3255bfef95601890afd80709
```

If error is stable you can try to rebuild cmake with system curl:
```
> cmake -H. -B_builds -DCMAKE_INSTALL_PREFIX=/path/to/install/cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_USE_SYSTEM_CURL=YES
```

If error is sporadic, well, C’est la vie, hit rebuild again (TODO retry parameter?)

### *_ROOT modification

`HunterGate` function (master file `<HUNTER_SELF>/cmake/Hunter` to be precise) clears all `*_ROOT` variables of internal packages (i.e. packages that installed by hunter). So if you set `<LIB>_ROOT` variable
between `HunterGate` and `hunter_add_package` calls hunter will not work correctly.

### include priority

If your package can be installed by hunter and use hunter, then you can be trapped by including
headers from hunter root instead of local path:

```
# hunter root
<hunter root>/include/some-dep # mypackage use it
<hunter root>/include/mypackage # ... and mypackage is in the hunter too (somebody already install it)

# mypackage/CMakeLists.txt
find_package(some-dep)
include_directories(${SOME_DEP_DIRECTORIES}) # Surprise, now <hunter root>/include/mypackage has priority!
include_directories(sources/include) # and this will be ignored...
```

Rule: local directories has **higher** priority then a system. Use `BEFORE` and `AFTER` suboptions of [include_directories](http://www.cmake.org/cmake/help/v3.0/command/include_directories.html) command to
avoid such kind of situations.