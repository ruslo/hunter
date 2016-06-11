include(CMakePackageConfigHelpers)
include(hunter_test_string_not_empty)

function(hunter_install_libsodium_config)

    hunter_test_string_not_empty("${HUNTER_libsodium_VERSION}")

    set(templates "${HUNTER_SELF}/cmake/templates")
    set(configs "${HUNTER_PACKAGE_INSTALL_PREFIX}/lib/cmake/libsodium")

    # Forward some variables
    if(BUILD_SHARED_LIBS)
        set(BUILD_SHARED_LIBS TRUE)
    endif()

    write_basic_package_version_file("${configs}/libsodiumConfig.cmake" VERSION "${HUNTER_libsodium_VERSION}" COMPATIBILITY ExactVersion)

    configure_file(
            "${templates}/libsodiumConfig.cmake.in"
            "${configs}/libsodiumConfig.cmake"
            @ONLY
    )
endfunction()