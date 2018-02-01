.. spelling::

    Jpeg

.. index:: media ; Jpeg

.. _pkg.Jpeg:

Jpeg
====

-  `Official <http://www.ijg.org/>`__
-  `Hunterized <https://github.com/hunter-packages/jpeg>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/Jpeg/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(Jpeg)
    find_package(JPEG CONFIG REQUIRED)
    target_link_libraries(... JPEG::jpeg)
