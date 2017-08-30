.. index:: frameworks ; Boost

.. _pkg.Boost:

Boost
=====

.. code-block:: cmake

    # Header-only libraries
    hunter_add_package(Boost)
    find_package(Boost CONFIG REQUIRED)
    target_link_libraries(... Boost::boost)

-  `Example <https://github.com/ruslo/hunter/blob/master/examples/Boost/CMakeLists.txt>`__

.. code-block:: cmake

    # Boost components (see list below)
    hunter_add_package(Boost COMPONENTS system filesystem)
    find_package(Boost CONFIG REQUIRED system filesystem)
    target_link_libraries(... Boost::system Boost::filesystem)

Examples:

- `Boost-uuid <https://github.com/ruslo/hunter/blob/master/examples/Boost-uuid/CMakeLists.txt>`__
- `Boost-system <https://github.com/ruslo/hunter/blob/master/examples/Boost-system/CMakeLists.txt>`__
- `Boost-iostreams <https://github.com/ruslo/hunter/blob/master/examples/Boost-iostreams/CMakeLists.txt>`__
- `Boost-filesystem <https://github.com/ruslo/hunter/blob/master/examples/Boost-filesystem/CMakeLists.txt>`__

List of components (other libraries are header-only):

- ``atomic``
- ``chrono``
- ``context``
- ``coroutine``
- ``date_time``
- ``exception``
- ``filesystem``
- ``graph``
- ``graph_parallel``
- ``iostreams``
- ``locale``
- ``log``
- ``math``
- ``mpi``
- ``program_options``
- ``python``
- ``random``
- ``regex``
- ``serialization``
- ``signals``
- ``system``
- ``test``
- ``thread``
- ``timer``
- ``wave``

Compatibility mode
------------------

.. code-block:: cmake

    hunter_add_package(Boost COMPONENTS system filesystem)
    set(Boost_USE_STATIC_LIBS ON)
    find_package(Boost REQUIRED system filesystem)
    if(MSVC)
      add_definitions(-DBOOST_ALL_NO_LIB=1)
    endif()

    include_directories(${Boost_INCLUDE_DIRS})
    target_link_libraries(... ${Boost_LIBRARIES})

CMake options
-------------

CMake options can be passed to boost build using ``CMAKE_ARGS`` feature
(see
`customization <https://github.com/ruslo/hunter/wiki/example.custom.config.id#custom-cmake-options>`__).
Options of special form ``<COMPONENT-UPPERCASE>_<OPTION>=<VALUE>`` will
be added to ``b2`` as ``-s <OPTION>=<VALUE>`` while building component .
For example:

.. code-block:: cmake

    hunter_config(Boost VERSION ... CMAKE_ARGS IOSTREAMS_NO_BZIP2=1)
    # add NO_BZIP2=1 to the b2 build of iostreams library, i.e. `b2 -s NO_BZIP2=1`

-  `boost.iostreams
   options <http://www.boost.org/doc/libs/1_57_0/libs/iostreams/doc/index.html?path=7>`__

Bugs
----

-  `Only static libs supported for
   now <https://github.com/ruslo/hunter/issues/130>`__
-  `boost.system analyzer <https://github.com/ruslo/hunter/issues/26>`__
-  `boost.filesystem
   analyzer <https://github.com/ruslo/hunter/issues/25>`__
-  `boost mingw <https://github.com/ruslo/hunter/issues/27>`__
-  `arm64 unknown <https://svn.boost.org/trac/boost/ticket/10910>`__
    -  workaround: set additional ``armv7``, i.e. when ``arm64`` build alone - result will be universal library ``armv7`` + ``arm64``

CI
--

-  Testing branch: https://github.com/ingenue/hunter/tree/pkg.boost
