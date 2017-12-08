.. spelling::

    carbon

.. index:: system_library_finder ; carbon

.. _pkg.carbon:

carbon
======

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(carbon REQUIRED)
    target_link_libraries(... carbon::carbon)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework Carbon")
