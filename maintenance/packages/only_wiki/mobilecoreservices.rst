.. spelling::

    mobilecoreservices

.. _pkg.mobilecoreservices:

    mobilecoreservices
    ==================
.. code:: cmake

    find_package(mobilecoreservices REQUIRED)
    target_link_libraries(... mobilecoreservices::mobilecoreservices)

Same as

.. code:: cmake

    target_link_libraries(... "-framework MobileCoreServices")

-  https://developer.apple.com/documentation/mobilecoreservices?language=objc
