.. spelling::

    jsoncpp

.. index:: json ; jsoncpp

.. _pkg.jsoncpp:

jsoncpp
=======

-  `Official <https://github.com/open-source-parsers/jsoncpp>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/jsoncpp/CMakeLists.txt>`__
-  Available since
   `v0.17.19 <https://github.com/ruslo/hunter/releases/tag/v0.17.19>`__

.. code-block:: cmake

    hunter_add_package(jsoncpp)

    find_package(jsoncpp CONFIG REQUIRED)
    target_link_libraries(... jsoncpp_lib_static)
