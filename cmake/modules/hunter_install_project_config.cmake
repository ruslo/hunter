include(hunter_test_string_not_empty)

function(hunter_install_project_config project_name)
    hunter_test_string_not_empty("${HUNTER_SELF}")
    hunter_test_string_not_empty("${HUNTER_PACKAGE_INSTALL_PREFIX}")
    hunter_test_string_not_empty("${HUNTER_${project_name}_VERSION}")

    set(templates "${HUNTER_SELF}/cmake/projects/${project_name}/templates")
    set(configs "${HUNTER_PACKAGE_INSTALL_PREFIX}/lib/cmake/${project_name}")

    configure_file(
        "${templates}/${project_name}ConfigVersion.cmake.in"
        "${configs}/${project_name}ConfigVersion.cmake"
        @ONLY
    )

    configure_file(
        "${templates}/${project_name}Config.cmake.in"
        "${configs}/${project_name}Config.cmake"
        @ONLY
    )
endfunction()
