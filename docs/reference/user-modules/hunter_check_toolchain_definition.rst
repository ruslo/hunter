.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

hunter_check_toolchain_definition
---------------------------------

This module can help users to get access to the C++ definitions in
``toolchain.info`` file (which is used for ``toolchain-id`` calculation).

For example if you need to check that current Windows toolchain has 64-bit
architecture:

.. code-block:: cmake
  :emphasize-lines: 3, 9-11, 13

  # cmake/project/Foo/hunter.cmake

  include(hunter_check_toolchain_definition)

  if(WIN32)
    # Windows platform

    # Check 64-bit or 32-bit
    hunter_check_toolchain_definition(
        NAME _WIN64 DEFINED _defined
    )

    if(_defined)
      # 64-bit
      hunter_add_version(...)
    else()
      # 32-bit
      hunter_add_version(...)
    endif()
  endif()

Value of definition can be checked too:

.. code-block:: cmake
  :emphasize-lines: 3, 6-10, 12, 14

  # cmake/project/Foo/hunter.cmake

  include(hunter_check_toolchain_definition)

  if(WIN32)
    hunter_check_toolchain_definition(
        NAME "_WIN32_WINNT"
        DEFINED _defined
        VALUE _value
    )

    # check '_defined'

    if("${_value}" STREQUAL "0x0603")
      # Windows 8.1
    endif()
  endif()
