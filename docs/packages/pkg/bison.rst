.. spelling::

    bison

.. index:: compiler ; bison

.. _pkg.foo:

foo
===

-  `Official <https://www.gnu.org/software/bison/>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/bison/CMakeLists.txt>`__
-  Added by `Isaac Hier <https://github.com/isaachier>`__ (`pr-1035 <https://github.com/ruslo/hunter/pull/1035>`__)

.. code-block:: cmake

    hunter_add_package(bison)
    find_package(BISON REQUIRED)
    BISON_TARGET(MyParser parser.y ${CMAKE_CURRENT_BINARY_DIR}/parser.cpp)
    add_executable(Foo main.cpp ${BISON_MyParser_OUTPUTS})
