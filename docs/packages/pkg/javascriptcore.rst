.. spelling::

    javascriptcore

.. index:: system_library_finder ; javascriptcore

.. _pkg.javascriptcore:

javascriptcore
==============

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(javascriptcore REQUIRED)
    target_link_libraries(... javascriptcore::javascriptcore)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework JavaScriptCore")

-  https://developer.apple.com/documentation/javascriptcore?language=objc
