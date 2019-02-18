.. spelling::

  hunteraddpackage


error.hunteraddpackage.after.project
====================================

What happens
------------

- CMake fatal error with message::

    [hunter ** FATAL ERROR **] Please set hunter_add_package *after* project command

Explanation
-----------

- First call to ``hunter_add_package`` command will trigger calculation of internal variables like ``config-id`` / ``toolchain-id``. This must be done after toolchain is loaded (i.e. after first ``project`` command) because variables from toolchain like ``APPLE`` or ``ANDROID`` can be used in configuration file with ``hunter_config``.

What to do
----------

- In general sequence must looks like this (see also `error.huntergate.before.project <https://docs.hunter.sh/en/latest/reference/errors/error.huntergate.before.project.html>`_):

  .. code-block:: cmake

     # Check CMake version before any commands
     cmake_minimum_required(VERSION 3.0)
     
     # Load HunterGate module
     include("cmake/HunterGate.cmake")
     
     # Use HunterGate module before first `project` command
     HunterGate(
         URL ...
         SHA1 ...
     )
     
     # Your project
     project(Foo)
     
     # Use hunter_add_package after project command
     hunter_add_package(Boo)

