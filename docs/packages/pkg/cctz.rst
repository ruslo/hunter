.. spelling::

    cctz

.. index:: datetime ; cctz

.. _pkg.cctz:

cctz
====

-  `Official <https://github.com/google/cctz>`__
-  `Hunterized <https://github.com/isaachier/cctz>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/cctz/CMakeLists.txt>`__
-  Added by `Isaac Hier <https://github.com/isaachier>`__ (`pr-1368 <https://github.com/ruslo/hunter/pull/1368>`__)

.. code-block:: cmake

    hunter_add_package(cctz)
    find_package(cctz CONFIG REQUIRED)
    target_link_libraries(... cctz::cctz)
