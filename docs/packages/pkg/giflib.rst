.. spelling::

    giflib

.. index:: media ; giflib

.. _pkg.giflib:

giflib
======

-  `Official <https://sourceforge.net/projects/giflib/>`__
-  `Hunterized <https://github.com/hunter-packages/giflib>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/giflib/CMakeLists.txt>`__
-  Added by `David Hirvonen <https://github.com/headupinclouds>`__ (`pr-1152 <https://github.com/ruslo/hunter/pull/1152>`__)

.. code-block:: cmake

    hunter_add_package(giflib)
    find_package(giflib CONFIG REQUIRED)
    target_link_libraries(giflib giflib::giflib)
