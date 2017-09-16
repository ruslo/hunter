.. spelling::

    polyclipping

.. index:: math ; polyclipping

.. _pkg.polyclipping:

polyclipping
============

-  `Official <https://sourceforge.net/projects/polyclipping/>`__
-  `Hunterized <https://github.com/hunter-packages/polyclipping>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/polyclipping/foo.cpp>`__

.. code-block:: cmake

    hunter_add_package(polyclipping)
    find_package(polyclipping CONFIG REQUIRED)
    target_link_libraries(... polyclipping::polyclipping)
