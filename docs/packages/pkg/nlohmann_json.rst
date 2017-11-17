.. spelling::

    nlohmann
    json

.. index:: json ; nlohmann_json

.. _pkg.nlohmann_json:

nlohmann_json
=============

-  `Official <https://github.com/nlohmann/json/>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/nlohmann_json/CMakeLists.txt>`__
-  V1.0.0 Available from
   `v0.12.13 <https://github.com/ruslo/hunter/releases/tag/v0.12.13>`__
   to
   `v0.19.52 <https://github.com/ruslo/hunter/releases/tag/v0.19.52>`__
-  V2.1.1 Available since
   `v0.19.52 <https://github.com/ruslo/hunter/releases/tag/v0.19.52>`__

Please note that C++ 11 is required, you can find the supported compiler versions in the official `README <https://github.com/nlohmann/json#supported-compilers>`__.

Usage
-----

since Hunter `v0.19.52 <https://github.com/ruslo/hunter/releases/tag/v0.19.52>`__

.. code-block:: cmake

    hunter_add_package(nlohmann_json)
    find_package(nlohmann_json CONFIG REQUIRED)
    target_link_libraries(... nlohmann_json)

before Hunter `v0.19.52 <https://github.com/ruslo/hunter/releases/tag/v0.19.52>`__

.. code-block:: cmake

    hunter_add_package(nlohmann-json)
    find_package(nlohmann-json REQUIRED)
    target_link_libraries(... nlohmann-json::nlohmann-json)

migration from V1.0.0 to V2.1.1
-------------------------------

-  replace all ``nlohmann-json`` with ``nlohmann_json``
-  add ``CONFIG`` to ``find_package(nlohmann_json CONFIG REQUIRED)``
-  shorten ``target_link_libraries()``, to
   ``target_link_libraries(... nlohmann_json)`` **no**
   ``nlohmann_json::nlohmann_json``
-  change ``#include <json.hpp>`` to ``#include <nlohmann/json.hpp>``
