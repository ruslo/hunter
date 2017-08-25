.. spelling::

    corelocation

.. _pkg.corelocation:

corelocation
============

File only available in wiki.
Please merge with hunter-package entry

.. code-block:: cmake

    find_package(corelocation REQUIRED)
    target_link_libraries(... corelocation::corelocation)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework CoreLocation")

-  https://developer.apple.com/documentation/corelocation?language=objc
