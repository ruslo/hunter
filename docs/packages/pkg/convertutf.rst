.. spelling::

    convertutf

.. index:: unsorted ; convertutf

.. _pkg.convertutf:

convertutf
==========

-  `Hunterized <https://github.com/hunter-packages/convertutf>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/convertutf/foo.cpp>`__

.. code-block:: cmake

    hunter_add_package(convertutf)
    find_package(convertutf CONFIG REQUIRED)
    target_link_libraries(... convertutf::convertutf)
