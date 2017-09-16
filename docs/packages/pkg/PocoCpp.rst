.. spelling::

    PocoCpp
    Util

.. index:: networking ; PocoCpp

.. _pkg.PocoCpp:

PocoCpp
=======

POCO C++ Libraries

-  `Official Repository <https://github.com/pocoproject/poco>`__
-  `Hunterized Repository <https://github.com/hunter-packages/poco>`__

.. code-block:: cmake

    hunter_add_package(PocoCpp)
    find_package(Poco REQUIRED Foundation CONFIG)
    target_link_libraries(... Poco::Foundation)

``find_package`` command requires at least one of the following
components, else CMake will fail.

Components are as follows:

- Foundation (``Poco::Foundation``)
- JSON (``Poco::JSON``)
- Net (``Poco::Net``)
- Util (``Poco::Util``)
- XML (``Poco::XML``)
- Zip (``Poco::Zip``)

**Note**: Components can be enabled or disabled by using
`CMAKE_ARGS <https://github.com/ruslo/hunter/blob/master/cmake/projects/PocoCpp/hunter.cmake>`__.
The map between ``CMAKE_ARGS`` and PocoCpp components can be found
`here <https://github.com/pocoproject/poco/blob/develop/CMakeLists.txt>`__.
