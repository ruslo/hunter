.. spelling::

    cpp
    redis

.. index:: unsorted ; cpp_redis

.. _pkg.cpp_redis:

cpp_redis
=========

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.18.51-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.18.51
  :alt: Hunter v0.18.51

-  `Official <https://github.com/Cylix/cpp_redis>`__
-  `Official github fork <https://github.com/Cylix/cpp_redis>`__
-  `Hunterized <https://github.com/hunter-packages/cpp_redis>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/cpp_redis/CMakeLists.txt>`__
- Available since |hunter|

.. code-block:: cmake

    hunter_add_package(cpp_redis)
    find_package(cpp_redis CONFIG REQUIRED)
    target_link_libraries(... cpp_redis::cpp_redis)
