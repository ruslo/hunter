.. spelling::

  huntergate


error.huntergate.before.project
===============================

What happens
------------

- CMake fatal error with message::

    [hunter ** FATAL ERROR **] Please set HunterGate *before* project command

Explanation
-----------

- Hunter designed to set some internal stuff like ``CMAKE_CXX_COMPILER``. Such variables must be modified before ``project`` command to work correctly

What to do
----------

- In general sequence must looks like this (see also `error.hunteraddpackage.after.project <https://docs.hunter.sh/en/latest/reference/errors/error.hunteraddpackage.after.project.html>`_):

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
     
     # Your project (must exist, see note below)
     project(Foo)
     
     # Use hunter_add_package after project command
     hunter_add_package(Boo)

- Note that if there is no ``project`` command in ``CMakeLists.txt`` then CMake will set ``PROJECT_NAME`` to ``Project`` which is same side-effect as calling ``project(Project)`` **before** ``HunterGate``. It means there **must** be at least one ``project`` call in ``CMakeLists.txt`` (which usually quite normal requirement). Related: https://github.com/ruslo/hunter/issues/285. Quite the same will happen if ``project`` command is in subdirectory so next code will not work too:

  .. code-block:: cmake

     # CMakeLists.txt
     cmake_minimum_required(VERSION 3.0)
     include("cmake/HunterGate.cmake")
     HunterGate(URL ... SHA1 ...)
     add_subdirectory(subdir1)

  .. code-block:: cmake

     # subdir1/CMakeLists.txt
     project(Foo)

  Fix is to place ``project`` in top ``CMakeLists.txt`` before ``add_subdirectory``:

  .. code-block:: cmake

     # CMakeLists.txt
     cmake_minimum_required(VERSION 3.0)
     include("cmake/HunterGate.cmake")
     HunterGate(URL ... SHA1 ...)
     project(Foo) # <--------------- before add_subdirectory
     add_subdirectory(subdir1)

