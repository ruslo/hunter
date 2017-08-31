.. spelling::

    CsvParserCPlusPlus

.. index:: csv ; CsvParserCPlusPlus

.. _pkg.CsvParserCPlusPlus:

CsvParserCPlusPlus
==================

-  `Official <https://github.com/headupinclouds/csv-parser-cplusplus>`__
-  Available since
   `v0.8.9 <https://github.com/ruslo/hunter/releases/tag/v0.8.9>`__

.. code-block:: cmake

    hunter_add_package(CsvParserCPlusPlus)
    find_package(CsvParserCPlusPlus CONFIG REQUIRED)
    target_link_libraries(... CsvParserCPlusPlus::csv_parser_cplusplus)
