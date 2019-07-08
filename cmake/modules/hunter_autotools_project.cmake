# Copyright (c) 2015 Ruslan Baratov, Alexandre Pretyman
# All rights reserved.
#
# This function builds an autotools based project.
#
# It forwards to ExternalProject_Add the following parameters:
#   URL, URL_HASH, DOWNLOAD_DIR, SOURCE_DIR and INSTALL_DIR
#
# Adds to the environment variables:
#   PATH=<root-id>/bin
#   PKG_CONFIG_LIBDIR=<root-id>/{lib,share}/pkgconfig
#
# Adds to autotools flags:
#   CPPFLAGS=-I<root-id>/include
#   LDFLAGS=-L<root-id>/lib

# Usage example:
# hunter_autotools_project("@HUNTER_EP_NAME@" # target name
#     HUNTER_SELF                             # hunter home
#       "@HUNTER_SELF@"
#     URL                                     # external project URL
#       @HUNTER_PACKAGE_URL@
#     URL_HASH                                # external project URL_HASH
#       SHA1=@HUNTER_PACKAGE_SHA1@
#     DOWNLOAD_DIR                            # external project DOWNLOAD_DIR
#       "@HUNTER_PACKAGE_DOWNLOAD_DIR@"
#     SOURCE_DIR                              # external project SOURCE_DIR
#       "@HUNTER_PACKAGE_SOURCE_DIR@"
#     BUILD_DIR                               # build directory
#       "@HUNTER_PACKAGE_BUILD_DIR@"
#     INSTALL_DIR                             # external project INSTALL_DIR
#       "@HUNTER_PACKAGE_INSTALL_PREFIX@"
#     GLOBAL_INSTALL_DIR                      # global installation directory
#       "@HUNTER_INSTALL_PREFIX@"
#     PARALLEL_JOBS                           # number of parallel jobs for make
#       "@HUNTER_JOBS_OPTION@"
#     PACKAGE_CONFIGURATION_TYPES             # build configuration (Release|Debug)
#       "@HUNTER_PACKAGE_CONFIGURATION_TYPES@"
#     CPPFLAGS                                # C pre-processor flags
#       "-DEXAMPLE -I/usr/local/include/library"
#     CFLAGS                                  # C Compiler flags
#       "-super-optimation"
#     CXXFLAGS                                # CXX compiler flags
#       "-super-optimation"
#     LDFLAGS                                 # Linker flags
#       "-L/usr/local/lib -llibrary"
#     EXTRA_FLAGS                             # any other flag that will go at the end
#       --enable-feature
#       --disable-other
#       --with-library
#     PATCH_COMMAND                           # add a patch command
#       ${CMAKE_COMMAND} -E copy "@HUNTER_PACKAGE_SCRIPT_DIR@/patch.sh" "@HUNTER_PACKAGE_SOURCE_DIR@"
#       COMMAND "./patch.sh"
#     BOOTSTRAP                               # add a bootstrap command to be run
#       "./autogen.sh"                        # before ./configure such as 
#                                             # ./autogen.sh or ./bootstrap
# )

include(ExternalProject) # ExternalProject_Add
include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_autotools_configure_command)
include(hunter_user_error)
include(hunter_status_debug)
include(hunter_assert_not_empty_string)

# Packages to test this function:
# * xau
# * gstreamer
# * libxml2
# * ncursesw
function(hunter_autotools_project target_name)
  set(optional_params)
  set(one_value_params
      HUNTER_SELF
      URL
      URL_HASH
      DOWNLOAD_DIR
      SOURCE_DIR
      BUILD_DIR
      INSTALL_DIR
      GLOBAL_INSTALL_DIR
      PARALLEL_JOBS
      CPPFLAGS
      CFLAGS
      CXXFLAGS
      LDFLAGS
      BOOTSTRAP
  )
  set(multi_value_params
      PACKAGE_CONFIGURATION_TYPES
      EXTRA_FLAGS
      PATCH_COMMAND
  )
  cmake_parse_arguments(
      PARAM
      "${optional_params}"
      "${one_value_params}"
      "${multi_value_params}"
      ${ARGN}
  )
  # -> PARAM_BUILD_DIR
  # -> PARAM_GLOBAL_INSTALL_DIR
  # -> PARAM_INSTALL_DIR

  if(PARAM_UNPARSED_ARGUMENTS)
    hunter_internal_error(
        "Invalid arguments passed to hunter_autotools_project:"
        " ${PARAM_UNPARSED_ARGUMENTS}"
    )
  endif()

  hunter_assert_not_empty_string("${PARAM_BUILD_DIR}")
  hunter_assert_not_empty_string("${PARAM_GLOBAL_INSTALL_DIR}")
  hunter_assert_not_empty_string("${PARAM_INSTALL_DIR}")
  hunter_assert_not_empty_string("${PARAM_PACKAGE_CONFIGURATION_TYPES}")

  set(default_path "/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin")
  set(shell_env_path "PATH=${PARAM_GLOBAL_INSTALL_DIR}/bin:${default_path}")

  set(shell_ld_path "LD_LIBRARY_PATH=${PARAM_GLOBAL_INSTALL_DIR}/lib:$ENV{LD_LIBRARY_PATH}")

  set(d1 "${PARAM_GLOBAL_INSTALL_DIR}/lib/pkgconfig")
  set(d2 "${PARAM_GLOBAL_INSTALL_DIR}/share/pkgconfig")
  set(shell_pkg_config_libdir "PKG_CONFIG_LIBDIR=${d1}:${d2}")

  set(clear_vars_shell_script "${PARAM_HUNTER_SELF}/scripts/clear-all.sh")

  set(shell_env
      .
      ${clear_vars_shell_script}
      &&
      ${shell_env_path}
      ${shell_pkg_config_libdir}
      ${shell_ld_path}
  )

  # Build command and options
  set(autotools_build_command "make")
  string(COMPARE NOTEQUAL "${PARAM_PARALLEL_JOBS}" "" have_jobs)
  if(have_jobs)
    list(APPEND autotools_build_command "-j" "${PARAM_PARALLEL_JOBS}")
  endif()

  set(build_command ${shell_env} ${autotools_build_command})

  string(COMPARE NOTEQUAL "${IPHONEOS_ARCHS}${IPHONESIMULATOR_ARCHS}" "" is_ios)
  if(is_ios)
    hunter_status_debug("Autotools iOS IPHONEOS_ARCHS: ${IPHONEOS_ARCHS} IPHONESIMULATOR_ARCHS: ${IPHONESIMULATOR_ARCHS}")
    if(BUILD_SHARED_LIBS)
      hunter_user_error("Autotools: building iOS libraries as shared is not supported")
    endif()
    set(ios_architectures)
    list(APPEND ios_architectures ${IPHONEOS_ARCHS} ${IPHONESIMULATOR_ARCHS})
  endif()

  if(NOT is_ios)
    hunter_autotools_configure_command(autotools_configure_command
       PACKAGE_INSTALL_DIR
         ${PARAM_INSTALL_DIR}
       EXTRA_FLAGS
         ${PARAM_EXTRA_FLAGS}
       INSTALL_DIR
         ${PARAM_GLOBAL_INSTALL_DIR}
       PACKAGE_CONFIGURATION_TYPES
         ${PARAM_PACKAGE_CONFIGURATION_TYPES}
       CPPFLAGS
         ${PARAM_CPPFLAGS}
       CFLAGS
         ${PARAM_CFLAGS}
       CXXFLAGS
         ${PARAM_CXXFLAGS}
       LDFLAGS
         ${PARAM_LDFLAGS}
    )

    set(configure_command ${shell_env} ${autotools_configure_command})

    ExternalProject_Add(${target_name}
        URL
          ${PARAM_URL}
        URL_HASH
          ${PARAM_URL_HASH}
        DOWNLOAD_DIR
          ${PARAM_DOWNLOAD_DIR}
        TLS_VERIFY
          "${HUNTER_TLS_VERIFY}"
        SOURCE_DIR
          ${PARAM_SOURCE_DIR}
        INSTALL_DIR
          ${PARAM_INSTALL_DIR}
          # not used, just avoid creating Install/<name> empty directory
        PATCH_COMMAND
          ${PARAM_PATCH_COMMAND}
        CONFIGURE_COMMAND
          "${PARAM_BOOTSTRAP}"
        COMMAND
          ${configure_command}
        BUILD_COMMAND
          ${build_command}
        BUILD_IN_SOURCE
          1
        INSTALL_COMMAND
          make install
    )
  else()
    set(ios_universal_target ${target_name}-universal)
    set(merge_lipo_script "autotools-merge-lipo.cmake")
    ExternalProject_Add(${ios_universal_target}
        DOWNLOAD_COMMAND
          ""
        TLS_VERIFY
          "${HUNTER_TLS_VERIFY}"
        SOURCE_DIR
          ${PARAM_SOURCE_DIR}/universal
        INSTALL_DIR
          ${PARAM_INSTALL_DIR}
          # not used, just avoid creating Install/<name> empty directory
        CONFIGURE_COMMAND
          ""
        BUILD_COMMAND
          ""
        BUILD_IN_SOURCE
          1
        INSTALL_COMMAND
        ${CMAKE_COMMAND}
        -P
        "${PARAM_SOURCE_DIR}/universal/${merge_lipo_script}"
    )
    set(ios_built_arch_roots)
    set(multi_arch_install_root ${PARAM_BUILD_DIR}/multi-arch)
    foreach(ios_architecture ${ios_architectures})
      hunter_status_debug("Autotools: building for iOS architecture ${ios_architecture}")

      #clear the conf options
      set(is_simulator FALSE)
      if(${ios_architecture} STREQUAL "armv7"
          OR ${ios_architecture} STREQUAL "armv7s")
        set(configure_host "arm-apple-darwin")
      elseif(${ios_architecture} STREQUAL "arm64")
        set(configure_host "aarch64-apple-darwin")
      elseif(${ios_architecture} STREQUAL "i386")
        set(configure_host "i386-apple-darwin")
        set(is_simulator TRUE)
      elseif(${ios_architecture} STREQUAL "x86_64")
        set(configure_host "x86_64-apple-darwin")
        set(is_simulator TRUE)
      else()
        hunter_user_error("iOS architecture: ${ios_architecture} not supported")
      endif()

      set(arch_flags)
      # Extra space at the end of the arch_flags is needed below when appending
      # to configure_opts, please do not remove!
      if(is_simulator)
        set(arch_flags "-arch ${ios_architecture} -isysroot ${IPHONESIMULATOR_SDK_ROOT} ")
      else()
        set(arch_flags "-arch ${ios_architecture} -isysroot ${IPHONEOS_SDK_ROOT} ")
      endif()
      set(arch_install_dir
          ${multi_arch_install_root}/${ios_architecture}
      )
      hunter_autotools_configure_command(autotools_configure_command
          PACKAGE_INSTALL_DIR
            ${arch_install_dir}
          EXTRA_FLAGS
            ${PARAM_EXTRA_FLAGS}
          CONFIGURE_HOST
            ${configure_host}
          INSTALL_DIR
            ${PARAM_GLOBAL_INSTALL_DIR}
          PACKAGE_CONFIGURATION_TYPES
            ${PARAM_PACKAGE_CONFIGURATION_TYPES}
          CPPFLAGS
            ${arch_flags}${PARAM_CPPFLAGS}
          CFLAGS
            ${arch_flags}${PARAM_CFLAGS}
          CXXFLAGS
            ${arch_flags}${PARAM_CXXFLAGS}
          LDFLAGS
            ${arch_flags}${PARAM_LDFLAGS}
      )
      set(configure_command ${shell_env} ${autotools_configure_command})

      # architecture specific source dir
      set(arch_source_dir
          ${PARAM_SOURCE_DIR}/multi-arch-build/${ios_architecture}
      )
      set(arch_target
          ${target_name}-${ios_architecture}
      )
      ExternalProject_Add(${arch_target}
          URL
            ${PARAM_URL}
          URL_HASH
            ${PARAM_URL_HASH}
          DOWNLOAD_DIR
            ${PARAM_DOWNLOAD_DIR}
          TLS_VERIFY
            "${HUNTER_TLS_VERIFY}"
          SOURCE_DIR
            ${arch_source_dir}
          INSTALL_DIR
            ${arch_install_dir}
            # not used, just avoid creating Install/<name> empty directory
          PATCH_COMMAND
            ${PARAM_PATCH_COMMAND}
          CONFIGURE_COMMAND
            "${PARAM_BOOTSTRAP}"
          COMMAND
            ${configure_command}
          BUILD_COMMAND
            ${build_command}
          BUILD_IN_SOURCE
            1
          INSTALL_COMMAND
            make install
      )

      list(APPEND ios_built_arch_roots ${arch_install_dir})
      add_dependencies(
        "${ios_universal_target}"
        "${arch_target}"
      )
    endforeach()

    set(HUNTER_PACKAGE_INSTALL_PREFIX ${PARAM_INSTALL_DIR})
    configure_file(
        "${PARAM_HUNTER_SELF}/scripts/${merge_lipo_script}.in"
        "${PARAM_SOURCE_DIR}/universal/${merge_lipo_script}"
        @ONLY
    )
  endif()
endfunction()
