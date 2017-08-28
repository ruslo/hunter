.. spelling::

    coregraphics

.. _pkg.coregraphics:

coregraphics
============

.. note::

    This is a helper package. There is no corresponding package in hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(coregraphics REQUIRED)
    target_link_libraries(... coregraphics::coregraphics)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework CoreGraphics")

-  https://developer.apple.com/documentation/coregraphics?language=objc
