.. spelling::

    accelerate

.. _pkg.accelerate:

accelerate
==========

File only available in wiki.
Please merge with hunter-package entry

.. code-block:: cmake

    find_package(accelerate REQUIRED)
    target_link_libraries(... accelerate::accelerate)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework Accelerate")

-  https://developer.apple.com/documentation/accelerate?language=objc
