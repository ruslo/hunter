.. spelling::

    applicationservices

.. index:: system_library_finder ; applicationservices

.. _pkg.applicationservices:

applicationservices
===================

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(applicationservices REQUIRED)
    target_link_libraries(... applicationservices::applicationservices)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework ApplicationServices")

-  https://developer.apple.com/documentation/applicationservices?language=objc
