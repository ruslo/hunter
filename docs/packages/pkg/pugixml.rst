.. spelling::

    pugixml

.. index:: xml ; pugixml

.. _pkg.pugixml:

pugixml
=======

-  `Official <https://pugixml.org/>`__
-  `Official GitHub <https://github.com/zeux/pugixml>`__
-  `Hunterized <https://github.com/rusdevops/pugixml>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/pugixml/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(pugixml)
    find_package(pugixml CONFIG REQUIRED)
    target_link_libraries(boo PUBLIC pugixml)
