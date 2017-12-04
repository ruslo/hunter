.. spelling::

    RapidJSON

.. index:: json ; RapidJSON

.. _pkg.RapidJSON:

RapidJSON
=========

-  http://rapidjson.org/
-  `GitHub official <https://github.com/miloyip/rapidjson>`__
-  `Hunterized <https://github.com/hunter-packages/rapidjson>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/rapidjson/condense.cpp>`__

.. code-block:: cmake

    hunter_add_package(RapidJSON)
    find_package(RapidJSON CONFIG REQUIRED)
    target_link_libraries(... RapidJSON::rapidjson)
