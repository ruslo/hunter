.. spelling::

    coredata

.. _pkg.coredata:

coredata
========

File only available in wiki.
Please merge with hunter-package entry

.. code-block:: cmake

    find_package(coredata REQUIRED)
    target_link_libraries(... coredata::coredata)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework CoreData")

-  https://developer.apple.com/documentation/coredata?language=objc
