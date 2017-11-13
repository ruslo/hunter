.. spelling::

    mongoose

.. index:: unsorted ; mongoose

.. _pkg.mongoose:

mongoose
============

-  `Official <https://github.com/cesanta/mongoose>`__
-  `Hunterized <https://github.com/hunter-packages/mongoose>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/mongoose/CMakeLists.txt>`__
-  Added by `dvirtz <https://github.com/dvirtz>`__ (`pr-1195 <https://github.com/ruslo/hunter/pull/1195>`__)

.. code-block:: cmake

    hunter_add_package(mongoose)
    find_package(mongoose CONFIG REQUIRED)

    add_executable(mongoose ...)
    target_link_libraries(mongoose mongoose::mongoose)
