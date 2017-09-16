.. spelling::

    corelocation

.. index:: system_library_finder ; corelocation

.. _pkg.corelocation:

corelocation
============

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(corelocation REQUIRED)
    target_link_libraries(... corelocation::corelocation)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework CoreLocation")

-  https://developer.apple.com/documentation/corelocation?language=objc
