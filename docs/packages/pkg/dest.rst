.. spelling::

    dest

.. index:: computer-vision ; dest

.. _pkg.dest:

dest
====

-  `Official GitHub <https://github.com/cheind/dest>`__
-  `Hunterized <https://github.com/hunter-packages/dest>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/dest/foo.cpp>`__

.. code-block:: cmake

    hunter_add_package(dest)
    find_package(dest CONFIG REQUIRED)
    target_link_libraries(... dest::dest)
