.. spelling::

    c-ares

.. index:: networking ; c-ares

.. _pkg.c-ares:

c-ares
======

-  `Official <https://github.com/c-ares/c-ares>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/c-ares/CMakeLists.txt>`__
-  Added by `Isaac Hier <https://github.com/isaachier>`__ (`pr-1087 <https://github.com/ruslo/hunter/pull/1087>`__)

.. code-block:: cmake

    hunter_add_package(c-ares)
    find_package(c-ares CONFIG REQUIRED)
    target_link_libraries(... c-ares::cares)
