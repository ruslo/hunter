include(CMakePackageConfigHelpers)
include(hunter_test_string_not_empty)

function(hunter_install_libxml2_config)

    hunter_test_string_not_empty("${HUNTER_libxml2_VERSION}")
    hunter_test_string_not_empty("${HUNTER_PACKAGE_INSTALL_PREFIX}")
    hunter_test_string_not_empty("${HUNTER_SELF}")

    set(templates "${HUNTER_SELF}/cmake/templates")
    set(configs   "${HUNTER_PACKAGE_INSTALL_PREFIX}/lib/cmake/libxml2")
    file(MAKE_DIRECTORY "${templates}" "${HUNTER_PACKAGE_INSTALL_PREFIX}/lib/cmake" "${configs}")

    write_basic_package_version_file("${configs}/libxml2Config.cmake" VERSION "${HUNTER_libxml2_VERSION}" COMPATIBILITY ExactVersion)

    configure_file(
            "${templates}/libxml2Config.cmake.in"
            "${configs}/libxml2Config.cmake"
            @ONLY
    )

endfunction()


function(hunter_install_libxml2_targets)

    hunter_test_string_not_empty("${HUNTER_PACKAGE_INSTALL_PREFIX}")
    hunter_test_string_not_empty("${HUNTER_SELF}")
    hunter_test_string_not_empty("${TARGET_CONFIGURATION}")
    hunter_test_string_not_empty("${TARGET_LIB_FILE}")

    set(templates "${HUNTER_SELF}/cmake/templates")
    set(configs   "${HUNTER_PACKAGE_INSTALL_PREFIX}/lib/cmake/libxml2")

    configure_file(
            "${templates}/libxml2Targets.cmake.in"
            "${configs}/libxml2Targets-${TARGET_CONFIGURATION}.cmake"
            @ONLY
    )

endfunction()