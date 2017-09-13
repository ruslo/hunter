.. spelling::

    flex

.. index:: compiler ; flex

.. _pkg.flex:

flex
=====

-  `Official <https://github.com/westes/flex>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/flex/CMakeLists.txt>`__
-  Added by `Isaac Hier <https://github.com/isaachier>`__ (`pr-1039 <https://github.com/ruslo/hunter/pull/1039>`__)

Simple flex example (no bison).

.. code-block:: cmake

    hunter_add_package(flex)
    find_package(FLEX REQUIRED)

    FLEX_TARGET(MyScanner numbers.lex ${CMAKE_CURRENT_BINARY_DIR}/numbers.cpp)
    add_executable(main ${FLEX_MyScanner_OUTPUTS})
    target_include_directories(main PUBLIC ${FLEX_INCLUDE_DIRS})
    target_link_libraries(main ${FLEX_LIBRARIES})

More complex example involving flex and bison. Based on `FindFLEX <https://cmake.org/cmake/help/v3.0/module/FindFLEX.html>`__.

.. code-block:: cmake

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
