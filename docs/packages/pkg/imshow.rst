.. spelling::

    imshow

.. index:: unsorted ; imshow

.. _pkg.imshow:

imshow
======

-  `Official <https://github.com/leonidk/imshow>`__
-  `Hunterized <https://github.com/hunter-packages/imshow>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/imshow/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(imshow)
    find_package(imshow CONFIG REQUIRED)
    target_link_libraries(... imshow::imshow)
