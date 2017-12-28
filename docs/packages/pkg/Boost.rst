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
- `Boost-math <https://github.com/ruslo/hunter/blob/master/examples/Boost-math/CMakeLists.txt>`__

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

You can use ``CMAKE_ARGS`` feature
(see
`customization <https://github.com/ruslo/hunter/wiki/example.custom.config.id#custom-cmake-options>`__)
to pass options to boost build or to append config macros in the default boost user
config file (``boost/config/user.hpp``):

- Options of special form ``<COMPONENT-UPPERCASE>_<OPTION>=<VALUE>`` will
  be added to ``b2`` as ``-s <OPTION>=<VALUE>`` while building component .
  For example:

  .. code-block:: cmake

    hunter_config(Boost ${HUNTER_Boost_VERSION} CMAKE_ARGS IOSTREAMS_NO_BZIP2=1)
    # add NO_BZIP2=1 to the b2 build of iostreams library, i.e. `b2 -s NO_BZIP2=1`

-  `boost.iostreams
   options <http://www.boost.org/doc/libs/1_57_0/libs/iostreams/doc/index.html?path=7>`__

- Options ``CONFIG_MACRO_<ID>=<VALUE>`` will append ``#define <ID> <VALUE>``
  to the default boost user config file. And options
  ``CONFIG_MACRO=<ID_1>;<ID_2>;...;<ID_n>`` will append ``#define <ID_1>``,
  ``#define <ID_2>``, ..., ``#define <ID_n>``.
  Example:

  .. code-block:: cmake

    hunter_config(Boost ${HUNTER_Boost_VERSION} CMAKE_ARGS
        CONFIG_MACRO=BOOST_REGEX_MATCH_EXTRA;BOOST_MPL_CFG_NO_PREPROCESSED_HEADERS
        CONFIG_MACRO_BOOST_MPL_LIMIT_LIST_SIZE=3
    )
    # append the next lines to boost/config/user.hpp:
    # #define BOOST_REGEX_MATCH_EXTRA
    # #define BOOST_MPL_CFG_NO_PREPROCESSED_HEADERS
    # #define CONFIG_MACRO_BOOST_MPL_LIMIT_LIST_SIZE 3

Math
----

When using Boost Math you will need to link in the libraries, however these are not named ``math`` but
rather are individual based on what you need to link it, the easiest of which is to link in all parts:

.. code-block:: cmake

    hunter_add_package(Boost COMPONENTS math)
    find_package(Boost CONFIG REQUIRED math_c99 math_c99f math_c99l math_tr1 math_tr1f math_tr1l)
    target_link_libraries(...
      Boost::math_c99
      Boost::math_c99f
      Boost::math_c99l
      Boost::math_tr1
      Boost::math_tr1f
      Boost::math_tr1l
    )

If you are using only the header-only parts of Boost::Math then the libraries can be ignored:

.. code-block:: cmake

    hunter_add_package(Boost COMPONENTS math)
    find_package(Boost CONFIG REQUIRED)

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
- `VSCMD_START_DIR issue <https://github.com/ruslo/hunter/issues/745#issuecomment-316629752>`__

CI
--

-  Testing branch: https://github.com/ingenue/hunter/tree/pkg.boost
