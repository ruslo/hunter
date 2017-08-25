.. spelling::

    glapi

.. _pkg.glapi:

    glapi
    =====
.. code:: cmake

    find_package(glapi REQUIRED)
    target_link_libraries(... glapi::glapi)

Ubuntu:

::

    > sudo apt-get install -y libgl1-mesa-dev

Travis:

.. code:: yaml

    addons:
      apt:
        packages:
          - libgl1-mesa-dev
