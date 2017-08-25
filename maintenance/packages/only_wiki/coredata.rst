.. spelling::

    coredata

.. _pkg.coredata:

coredata
========

.. code-block:: cmake

    find_package(coredata REQUIRED)
    target_link_libraries(... coredata::coredata)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework CoreData")

-  https://developer.apple.com/documentation/coredata?language=objc
