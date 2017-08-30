.. spelling::

    accelerate

.. index:: system_library_finder ; accelerate

.. _pkg.accelerate:

accelerate
==========

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(accelerate REQUIRED)
    target_link_libraries(... accelerate::accelerate)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework Accelerate")

-  https://developer.apple.com/documentation/accelerate?language=objc
