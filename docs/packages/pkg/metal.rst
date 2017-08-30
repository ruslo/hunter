.. spelling::

    metal

.. index:: system_library_finder ; metal

.. _pkg.metal:

metal
=====

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(metal REQUIRED)
    target_link_libraries(... metal::metal)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework Metal")

-  https://developer.apple.com/documentation/metal?language=objc
