.. spelling::

    PostgreSQL

.. index:: database ; PostgreSQL

.. _pkg.PostgreSQL:

PostgreSQL
==========

-  `Official <http://www.postgresql.org/>`__
-  `Hunterized <https://github.com/hunter-packages/PostgreSQL>`__
-  `Example <https://github.com/ruslo/hunter/blob/develop/examples/PostgreSQL/CMakeLists.txt>`__
-  Available since
   `v0.12.35 <https://github.com/ruslo/hunter/releases/tag/v0.12.35>`__
-  Added by `Alexandre Pretyman <https://github.com/pretyman>`__
   (`pr-301 <https://github.com/ruslo/hunter/pull/301>`__)

.. code-block:: cmake

    hunter_add_package(PostgreSQL)
    find_package(PostgreSQL REQUIRED)
    target_link_libraries(... PostgreSQL::libpq)

Ubuntu workarounds for missing dependencies (See
`pr-301 <https://github.com/ruslo/hunter/pull/301>`__):

.. code::

    sudo apt-get install libreadline-dev
    sudo apt-get install bison
    sudo apt-get install flex
