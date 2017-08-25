.. spelling::

    coregraphics

.. _pkg.coregraphics:

coregraphics
============

File only available in wiki.
Please merge with hunter-package entry

.. code-block:: cmake

    find_package(coregraphics REQUIRED)
    target_link_libraries(... coregraphics::coregraphics)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework CoreGraphics")

-  https://developer.apple.com/documentation/coregraphics?language=objc
