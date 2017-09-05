.. spelling::

    CsvParserCPlusPlus

.. index:: csv ; CsvParserCPlusPlus

.. _pkg.CsvParserCPlusPlus:

CsvParserCPlusPlus
==================

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.8.9-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.8.9
  :alt: Hunter v0.8.9

-  `Official <https://github.com/headupinclouds/csv-parser-cplusplus>`__
- Available since |hunter|

.. code-block:: cmake

    hunter_add_package(CsvParserCPlusPlus)
    find_package(CsvParserCPlusPlus CONFIG REQUIRED)
    target_link_libraries(... CsvParserCPlusPlus::csv_parser_cplusplus)
