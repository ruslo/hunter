### Fetch failed (windows) #1 

* Error message

```
hudson.plugins.git.GitException: Failed to fetch from ...
Caused by: hudson.plugins.git.GitException: Command "git.exe clean -fdx" returned status code 1:
```

* Reason

Possible reason is that some internal paths from build directory is too long for windows

* Solution

Use native windows command `rmdir` before git checkout, for example python script which remove `_builds` directory
([plugin used](https://wiki.jenkins-ci.org/display/JENKINS/pre-scm-buildstep)):
```python
import os

if os.name == 'nt':
  # Fix windows error: `path too long`
  os.system('rmdir _builds /s /q')
```

### Fetch failed (windows) #2

* Same reason but another solution. Tune git: [windows path too long for git](http://stackoverflow.com/a/22831095/2288008)

### Path too long (windows)

* Reason

Path too long somewhere in a build step.

* Solution (`HUNTER_JUNCTIONS`)

Create a directory with a short path (like: `C:\jenkins\junctions`) and set an environment variable `HUNTER_JUNCTIONS` to point to this directory. Hunter will detect this variable and use this directory
 to create [junction point](http://en.wikipedia.org/wiki/NTFS_junction_point).
You can verify that directory used by adding cmake variable `HUNTER_STATUS_DEBUG=ON`:

```
-- [hunter *** DEBUG ***] HUNTER_JUNCTIONS: C:/jenkins/junctions
-- [hunter *** DEBUG ***] Create windows junction:
-- [hunter *** DEBUG ***]   from: C:/jenkins/home/workspace/HunterGate/CONFIG/Debug/TOOLCHAIN/nmake-vs2013-x64/label/windows/_builds/nmake-vs2013-x64-Debug/_3rdParty/hunter/external
-- [hunter *** DEBUG ***]   to: C:/jenkins/junctions/lL1Pzqi5vb
Junction created for C:\jenkins\junctions\lL1Pzqi5vb <<===>> C:\jenkins\home\workspace\HunterGate\CONFIG\Debug\TOOLCHAIN\nmake-vs2013-x64\label\windows\_builds\nmake-vs2013-x64-Debug\_3rdParty\hunter\external
...
-- [hunter *** DEBUG ***] Generate step successful (dir: C:/jenkins/junctions/lL1Pzqi5vb)
...
-- [hunter *** DEBUG ***] Run build
-- [hunter *** DEBUG ***] Build step successful (dir: C:/jenkins/junctions/lL1Pzqi5vb)
```