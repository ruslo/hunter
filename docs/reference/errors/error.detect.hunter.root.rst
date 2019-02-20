error.detect.hunter.root
========================

What happens
------------

- CMake fatal error with message::

    [hunter ** FATAL ERROR **] Can't detect HUNTER_ROOT

Explanation
-----------

- Hunter need to have directory where all the packages will be installed. Next locations tried (by priority):

    - CMake variable ``HUNTER_ROOT`` (*high priority*; not recommended, since you need to set it for every build)
    - Environment variable ``HUNTER_ROOT`` (recommended, full control over directory location shared between all projects)
    - Environment variable ``HOME`` (*low priority*)
    - Environment variable ``SYSTEMDRIVE`` (Windows only)
    - Environment variable ``USERPROFILE`` (Windows only)

What to do
----------

- Fix your environment. ``HOME`` usually defined on Unix-like platforms and ``SYSTEMDRIVE`` / ``USERPROFILE`` on Windows
- Set ``HUNTER_ROOT`` environment variable (restart all CMake GUI's or terminals to apply changes)
