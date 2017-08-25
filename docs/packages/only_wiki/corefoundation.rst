.. spelling::

    corefoundation

.. _pkg.corefoundation:

corefoundation
==============

File only available in wiki.
Please merge with hunter-package entry

.. code-block:: cmake

    find_package(corefoundation REQUIRED)
    target_link_libraries(... corefoundation::corefoundation)

Same as

::

    target_link_libraries(... "-framework CoreFoundation")

-  https://developer.apple.com/documentation/corefoundation?language=objc
