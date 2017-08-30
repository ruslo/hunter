.. spelling::

    android_log

.. index:: system_library_finder ; android_log

.. _pkg.android_log:

android_log
===========

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(android_log REQUIRED)
    target_link_libraries(... android_log::android_log)
