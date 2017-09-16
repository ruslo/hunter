.. spelling::

    RapidXML

.. index:: xml ; RapidXML

.. _pkg.RapidXML:

RapidXML
========

-  `Official <http://rapidxml.sourceforge.net/>`__
-  `Original Fork of Marcin Kalicinski's RapidXml
   library <https://github.com/timniederhausen/rapidxml>`__
-  `Hunterized <https://github.com/hunter-packages/rapidxml>`__
-  `Example <https://github.com/ruslo/hunter/tree/master/examples/RapidXML>`__

.. code-block:: cmake

    hunter_add_package(RapidXML)
    find_package(RapidXML REQUIRED CONFIG)
    target_link_libraries(foo RapidXML::RapidXML)
