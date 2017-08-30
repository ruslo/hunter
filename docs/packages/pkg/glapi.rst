.. spelling::

    glapi

.. index:: system_library_finder ; glapi

.. _pkg.glapi:

glapi
=====

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(glapi REQUIRED)
    target_link_libraries(... glapi::glapi)

Ubuntu:

::

    > sudo apt-get install -y libgl1-mesa-dev

Travis:

.. code-block:: yaml

    addons:
      apt:
        packages:
          - libgl1-mesa-dev
