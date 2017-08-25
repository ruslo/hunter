.. spelling::

    corefoundation

.. _pkg.corefoundation:

    corefoundation
    ==============
.. code:: cmake

    find_package(corefoundation REQUIRED)
    target_link_libraries(... corefoundation::corefoundation)

Same as

::

    target_link_libraries(... "-framework CoreFoundation")

-  https://developer.apple.com/documentation/corefoundation?language=objc
