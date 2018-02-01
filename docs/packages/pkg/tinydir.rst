.. spelling::

    tinydir

.. index:: filesystem ; tinydir

.. _pkg.tinydir:

tinydir
=======

-  `GitHub Official <https://github.com/cxong/tinydir>`__
-  `Hunterized <https://github.com/hunter-packages/tinydir>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/tinydir/foo.cpp>`__

.. code-block:: cmake

    hunter_add_package(tinydir)
    find_package(tinydir CONFIG REQUIRED)
    target_link_libraries(... tinydir::tinydir)
