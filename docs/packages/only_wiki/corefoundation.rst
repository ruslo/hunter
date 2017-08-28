.. spelling::

    corefoundation

.. _pkg.corefoundation:

corefoundation
==============

.. note::

    This is a helper package. There is no corresponding package in hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(corefoundation REQUIRED)
    target_link_libraries(... corefoundation::corefoundation)

Same as

::

    target_link_libraries(... "-framework CoreFoundation")

-  https://developer.apple.com/documentation/corefoundation?language=objc
