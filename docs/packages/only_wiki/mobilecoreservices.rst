.. spelling::

    mobilecoreservices

.. _pkg.mobilecoreservices:

mobilecoreservices
==================

File only available in wiki.
Please merge with hunter-package entry

.. code-block:: cmake

    find_package(mobilecoreservices REQUIRED)
    target_link_libraries(... mobilecoreservices::mobilecoreservices)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework MobileCoreServices")

-  https://developer.apple.com/documentation/mobilecoreservices?language=objc
