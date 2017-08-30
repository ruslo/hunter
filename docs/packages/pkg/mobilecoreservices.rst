.. spelling::

    mobilecoreservices

.. index:: system_library_finder ; mobilecoreservices

.. _pkg.mobilecoreservices:

mobilecoreservices
==================

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(mobilecoreservices REQUIRED)
    target_link_libraries(... mobilecoreservices::mobilecoreservices)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework MobileCoreServices")

-  https://developer.apple.com/documentation/mobilecoreservices?language=objc
