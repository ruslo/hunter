# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(hunter_test_string_not_empty)

function(hunter_install_boost_config)
  hunter_test_string_not_empty("${HUNTER_SELF}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_INSTALL_PREFIX}")
  hunter_test_string_not_empty("${HUNTER_Boost_VERSION}")

  set(templates "${HUNTER_SELF}/cmake/templates")
  set(configs "${HUNTER_PACKAGE_INSTALL_PREFIX}/lib/cmake/Boost")

  configure_file(
      "${templates}/BoostConfigVersion.cmake.in"
      "${configs}/BoostConfigVersion.cmake"
      @ONLY
  )

  configure_file(
      "${templates}/BoostConfig.cmake.in"
      "${configs}/BoostConfig.cmake"
      @ONLY
  )

  if(BOOST_CONFIG_LINK_ZLIB)
    configure_file(
        "${templates}/BoostZLIBDependency.cmake.in"
        "${configs}/BoostZLIBDependency.cmake"
        @ONLY
    )
  endif()

  if(BOOST_CONFIG_LINK_BZIP2)
    configure_file(
        "${templates}/BoostBZip2Dependency.cmake.in"
        "${configs}/BoostBZip2Dependency.cmake"
        @ONLY
    )
  endif()
endfunction()
