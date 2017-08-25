.. spelling::

    mobilecoreservices

.. _pkg.mobilecoreservices:

    mobilecoreservices
    ==================
.. code-block::cmake

    find_package(mobilecoreservices REQUIRED)
    target_link_libraries(... mobilecoreservices::mobilecoreservices)

Same as

.. code-block::cmake

    target_link_libraries(... "-framework MobileCoreServices")

-  https://developer.apple.com/documentation/mobilecoreservices?language=objc
