.. spelling::

    poly
    tri

.. index:: math ; poly2tri

.. _pkg.poly2tri:

poly2tri
========

-  `Official <https://github.com/jhasse/poly2tri>`__
-  `Hunterized <https://github.com/hunter-packages/poly2tri>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/poly2tri/foo.cpp>`__

.. code-block:: cmake

    hunter_add_package(poly2tri)
    find_package(poly2tri CONFIG REQUIRED)
    target_link_libraries(... poly2tri::poly2tri)
