.. spelling::

    crashpad

.. index:: testing ; crashpad

.. _pkg.crashpad:

crashpad
========

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.15.22-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.15.22
  :alt: Hunter v0.15.22

-  `Official <https://crashpad.chromium.org/index.html>`__
-  `Hunterized <https://github.com/qedsoftware/crashpad>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/crashpad/foo.cpp>`__
- Available since |hunter|

   .. code:: cmake

       hunter_add_package(crashpad)
       find_package(crashpad CONFIG REQUIRED)
       target_link_libraries(... crashpad::crashpad_client)

Use this code in case you want to copy ``crashpad_handler`` to the
directory with ``foo`` executable:

.. code-block:: cmake

    add_custom_command(
        TARGET foo
        PRE_BUILD
        COMMAND
        "${CMAKE_COMMAND}" -E copy
        "$<TARGET_FILE:crashpad::crashpad_handler>"
        "$<TARGET_FILE_DIR:foo>"
    )
