.. spelling::

    flex

.. index:: compiler ; flex

.. _pkg.flex:

flex
=====

-  `Official <https://github.com/westes/flex/>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/flex/CMakeLists.txt>`__
-  Added by `Isaac Hier <https://github.com/isaachier>`__ (`pr-N <https://github.com/ruslo/hunter/pull/N>`__)

.. code-block:: cmake

    # Based on https://cmake.org/cmake/help/v3.0/module/FindFLEX.html.
    # TODO: hunter_add_package(bison)
    find_package(BISON REQUIRED)
    hunter_add_package(flex)
    find_package(FLEX REQUIRED)
    BISON_TARGET(MyParser parser.y ${CMAKE_CURRENT_BINARY_DIR}/parser.cpp)
    FLEX_TARGET(MyScanner lexer.l  ${CMAKE_CURRENT_BINARY_DIR}/lexer.cpp)
    ADD_FLEX_BISON_DEPENDENCY(MyScanner MyParser)  # MyParser defines tokens for MyScanner

    add_executable(main main.cpp ${BISON_MyParser_OUTPUTS} ${FLEX_MyScanner_OUTPUTS})
    target_include_directories(main
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>
        ${BISON_INCLUDE_DIRS}
        ${FLEX_INCLUDE_DIRS})
    target_link_libraries(main ${BISON_LIBRARIES} ${FLEX_LIBRARIES})
