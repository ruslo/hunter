.. spelling::

    BZip

.. index:: compression ; BZip2

.. _pkg.BZip2:

BZip2
=====

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.9.9-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.9.9
  :alt: Hunter v0.9.9

-  `Official <http://bzip.org>`__
-  `Hunterized <https://github.com/hunter-packages/bzip2>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/BZip2/CMakeLists.txt>`__
- Available since |hunter|

.. code-block:: cmake

    hunter_add_package(BZip2)

    find_package(BZip2 CONFIG REQUIRED)
    target_link_libraries(... BZip2::bz2)
