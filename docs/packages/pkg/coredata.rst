.. spelling::

    coredata

.. index:: system_library_finder ; coredata

.. _pkg.coredata:

coredata
========

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(coredata REQUIRED)
    target_link_libraries(... coredata::coredata)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework CoreData")

-  https://developer.apple.com/documentation/coredata?language=objc
