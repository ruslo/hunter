.. spelling::

    assetslibrary

.. index:: system_library_finder ; assetslibrary

.. _pkg.assetslibrary:

assetslibrary
=============

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(assetslibrary REQUIRED)
    target_link_libraries(... assetslibrary::assetslibrary)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework AssetsLibrary")

-  https://developer.apple.com/documentation/assetslibrary?language=objc
