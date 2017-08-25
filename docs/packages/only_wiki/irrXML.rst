.. spelling::

    irrXML

.. _pkg.irrXML:

irrXML
======

File only available in wiki.
Please merge with hunter-package entry

-  `Official <http://www.ambiera.com/irrxml/>`__
-  `Hunterized <https://github.com/hunter-packages/irrXML>`__

.. code-block:: cmake

    hunter_add_package(irrXML)
    find_package(irrXML CONFIG REQUIRED)
    target_link_libraries(... irrXML::irrXML)
