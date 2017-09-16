.. spelling::

    CURL

.. index:: networking ; CURL

.. _pkg.CURL:

CURL
====

-  `Official <https://github.com/curl/curl>`__
-  `Hunterized <https://github.com/hunter-packages/curl>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/CURL/foo.cpp>`__

.. code-block:: cmake

    hunter_add_package(CURL)
    find_package(CURL CONFIG REQUIRED)
    target_link_libraries(... CURL::libcurl)
