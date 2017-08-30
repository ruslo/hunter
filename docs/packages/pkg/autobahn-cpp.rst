.. spelling::

    cpp

.. index:: networking ; autobahn-cpp

.. _pkg.autobahn-cpp:

autobahn-cpp
============

-  `Official Autobahn <http://autobahn.ws/>`__
-  `Official Autobahn-cpp <http://autobahn.ws/cpp/>`__
-  `Hunterized <https://github.com/hunter-packages/autobahn-cpp>`__
-  `Examples <https://github.com/ruslo/hunter/tree/master/examples/autobahn-cpp>`__

This is a C++11 library. On Windows only VS14 is supported.

.. code-block:: cmake

    set (CMAKE_CXX_STANDARD11)
    hunter_add_package(autobahn-cpp)
    find_package(autobahn-cpp CONFIG REQUIRED)
    target_link_libraries(... autobahn-cpp::autobahn-cpp)
