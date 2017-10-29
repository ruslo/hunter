.. spelling::

    foo

.. index:: unsorted ; foo

.. _pkg.foo:

foo
===

-  `Official <https://sfml-dev.org>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/SFML/CMakeLists.txt>`__
-  Added by `nuke_bird <https://github.com/NukeBird>`__ (`pr-1129 <https://github.com/ruslo/hunter/pull/1129>`__)

.. code-block:: cmake

    hunter_add_package(SFML)
    find_package(SFML CONFIG REQUIRED)
    target_link_libraries(foo SFML::system SFML::window SFML::graphics SFML::network SFML::audio)