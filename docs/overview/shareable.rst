.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

Shareable
---------

A root directory with installed packages can be shared between several local
projects. If one local project triggers installation of a new third
party package, then the root directory will be locked against modifications until the install
has either finished or interrupted (i.e. Ctrl-C). Other local projects that try to run
``hunter_add_package`` for the same root at the same time will automatically wait for the root
to be unlocked. Note that different root directories have independent locks,
e.g. triggering a build of ``OpenSSL`` for ``iOS`` will not delay building of
``GTest`` for ``Android``.  Internally this is done using the ``file(LOCK ...)`` CMake
command (available since ``3.2``).

Similar synchronization is done when initializing Hunter using the ``HunterGate`` command.
This is a very handy feature for CI systems where an environment is shared
between several jobs, e.g. Jenkins.
