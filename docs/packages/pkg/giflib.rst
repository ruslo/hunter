.. spelling::

    foo

.. index:: unsorted ; giflib

.. _pkg.foo:

giflib
===

-  `Official <http://giflib.sourceforge.net/`__
-  Added by `sgara <https://github.com/sgara>`__ (`pr-1028 <https://github.com/ruslo/hunter/pull/1028>`__)

.. code-block:: cmake

    hunter_add_package(giflib)
    find_package(giflib REQUIRED)
    target_link_libraries(foo giflib)
