.. spelling::

    Expat

.. index:: xml ; Expat

.. _pkg.Expat:

Expat
=====

-  `Official <http://sourceforge.net/projects/expat>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/Expat/CMakeLists.txt>`__
-  Added by `Alexander Lamaison <https://github.com/alamaison>`__
   (`pr-59 <https://github.com/ruslo/hunter/pull/59>`__)

.. code-block:: cmake

    hunter_add_package(Expat)
    find_package(EXPAT REQUIRED)

    target_link_libraries(... ${EXPAT_LIBRARIES})
    target_include_directories(... ${EXPAT_INCLUDE_DIRS})

CI
--

-  https://github.com/ingenue/hunter/tree/pkg.expat
