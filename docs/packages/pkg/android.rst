.. spelling::

    android

.. index:: system_library_finder; android

.. _pkg.android:

android
=======

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(android REQUIRED)
    target_link_libraries(... android::android)
