.. spelling::

    accelerate

.. _pkg.accelerate:

    accelerate
    ==========
.. code:: cmake

    find_package(accelerate REQUIRED)
    target_link_libraries(... accelerate::accelerate)

Same as

.. code:: cmake

    target_link_libraries(... "-framework Accelerate")

-  https://developer.apple.com/documentation/accelerate?language=objc
