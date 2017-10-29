.. spelling::

    OpenAL

.. index:: media ; OpenAL

.. _pkg.OpenAL:

OpenAL
======

-  `Official <https://github.com/kcat/openal-soft>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/OpenAL/CMakeLists.txt>`__
-  Added by `Isaac Hier <https://github.com/isaachier>`__ (`pr-1128 <https://github.com/ruslo/hunter/pull/1128>`__)

.. code-block:: cmake

    hunter_add_package(OpenAL)
    find_package(OpenAL CONFIG REQUIRED)
    target_link_libraries(... OpenAL::OpenAL)
