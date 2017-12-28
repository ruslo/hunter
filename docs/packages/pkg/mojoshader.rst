.. spelling::

    mojoshader

.. index:: graphics ; mojoshader

.. _pkg.mojoshader:

mojoshader
==========

-  https://www.icculus.org/mojoshader/
-  `Hunterized <https://github.com/hunter-packages/mojoshader>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/mojoshader/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(mojoshader)
    find_package(mojoshader CONFIG REQUIRED)
    target_link_libraries(boo PUBLIC mojoshader::mojoshader)
