.. spelling::

    civetweb

.. index:: networking ; civetweb

.. _pkg.civetweb:

civetweb
========

-  `Official GitHub <https://github.com/civetweb/civetweb>`__
-  `Hunterized <https://github.com/hunter-packages/civetweb>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/civetweb/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(civetweb)
    find_package(civetweb CONFIG REQUIRED)
    target_link_libraries(boo PUBLIC civetweb::c-library)
