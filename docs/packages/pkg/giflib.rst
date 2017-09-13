.. spelling::

    foo

.. index:: media ; giflib

.. _pkg.giflib:

giflib
===

-  `Official <http://giflib.sourceforge.net/>`__
-  Added by `sgara <https://github.com/sgara>`__ (`pr-1031 <https://github.com/ruslo/hunter/pull/1031>`__)

.. code-block:: cmake

    hunter_add_package(giflib)
    find_package(giflib REQUIRED)
    target_link_libraries(foo giflib)
