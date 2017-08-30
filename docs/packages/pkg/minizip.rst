.. spelling::

    minizip

.. index:: compression ; minizip

.. _pkg.minizip:

minizip
=======

-  `Official <http://www.winimage.com/zLibDll/minizip.html>`__
-  `Hunterized <https://github.com/hunter-packages/minizip>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/minizip/foo.cpp>`__

.. code-block:: cmake

    hunter_add_package(minizip)
    find_package(minizip CONFIG REQUIRED)
    target_link_libraries(... minizip::minizip)
