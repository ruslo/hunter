.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

Shareable
---------

Root directory with installed packages can be shared between several local
projects. In case if one local project trigger installing of some new third
party package then root directory will be locked for modifications until install
finished or interrupted. Other local project that will try to run
``hunter_add_package`` in same root will be automatically paused and spin
waiting for unlock. Note that different root directories do different locks,
e.g.  triggering build of ``OpenSSL`` for ``iOS`` will not pause building of
``GTest`` for ``Android``.  Internally this is done by ``file(LOCK ...)`` CMake
command (available since ``3.2``).

Same synchronization done for the initializing Hunter by ``HunterGate`` command.
This is very handy feature for the CI systems with environment which is shared
between several jobs, e.g. Jenkins.
