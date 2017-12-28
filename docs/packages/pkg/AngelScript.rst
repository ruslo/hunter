.. spelling::

    AngelScript

.. index:: unsorted ; AngelScript

.. _pkg.AngelScript:

AngelScript
===========

-  `Official <http://www.angelcode.com/angelscript/>`__
-  `Hunterized <https://github.com/hunter-packages/AngelScript>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/AngelScript/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(AngelScript)
    find_package(AngelScript CONFIG REQUIRED)
    target_link_libraries(boo PUBLIC AngelScript::AngelScript)
