.. spelling::

    coremotion

.. index:: system_library_finder ; coremotion

.. _pkg.coremotion:

coremotion
==========

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(coremotion REQUIRED)
    target_link_libraries(... coremotion::coremotion)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework CoreMotion")

-  https://developer.apple.com/documentation/coremotion?language=objc
