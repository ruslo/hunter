.. spelling::

    dlib

.. index:: computer-vision ; dlib

.. _pkg.dlib:

dlib
====

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.9.2-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.9.2
  :alt: Hunter v0.9.2

-  `Official <http://dlib.net/>`__
-  `Official github fork <https://github.com/davisking/dlib>`__
-  `Hunterized <https://github.com/hunter-packages/dlib>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/dlib/CMakeLists.txt>`__
- Available since |hunter|

.. code-block:: cmake

    hunter_add_package(dlib)
    find_package(dlib CONFIG REQUIRED)
    target_link_libraries(... dlib::dlib)
