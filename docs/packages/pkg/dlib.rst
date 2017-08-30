.. spelling::

    dlib

.. index:: computer-vision ; dlib

.. _pkg.dlib:

dlib
====

-  `Official <http://dlib.net/>`__
-  `Official github fork <https://github.com/davisking/dlib>`__
-  `Hunterized <https://github.com/hunter-packages/dlib>`__
-  `Example <https://github.com/ruslo/hunter/blob/develop/examples/dlib/CMakeLists.txt>`__
-  Available since
   `v0.9.2 <https://github.com/ruslo/hunter/releases/tag/v0.9.2>`__

.. code-block:: cmake

    hunter_add_package(dlib)
    find_package(dlib CONFIG REQUIRED)
    target_link_libraries(... dlib::dlib)
