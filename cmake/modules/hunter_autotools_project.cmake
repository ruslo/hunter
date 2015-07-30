# Copyright (c) 2015 Ruslan Baratov, Alexandre Pretyman
# All rights reserved.
#
# This function builds an autotools based project.
#
# It forwards to ExternalProject_Add the following parameters:
#   URL, URL_HASH, DOWNLOAD_DIR, SOURCE_DIR and INSTALL_DIR
#
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
#     INSTALL_DIR                             # external project INSTALL_DIR
#       "@HUNTER_PACKAGE_INSTALL_PREFIX@"
#     PARALLEL_JOBS                           # number of parallel jobs for make
#       "@HUNTER_JOBS_OPTION@"
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
# )

include(ExternalProject) # ExternalProject_Add
include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_fatal_error)
include(hunter_status_debug)
include(hunter_test_string_not_empty)

function(hunter_autotools_project target_name)

  set(optional_params)
  set(one_value_params
      HUNTER_SELF
      URL
      URL_HASH
      DOWNLOAD_DIR
      SOURCE_DIR
      INSTALL_DIR
      PARALLEL_JOBS
      CPPFLAGS
      CFLAGS
      CXXFLAGS
      LDFLAGS
  )
  set(multi_value_params EXTRA_FLAGS)
  cmake_parse_arguments(
      PARAM
      "${optional_params}"
      "${one_value_params}"
      "${multi_value_params}"
      ${ARGN}
  )

  if(PARAM_UNPARSED_ARGUMENTS)
    hunter_fatal_error(
        "Invalid arguments passed to hunter_autotools_configure:"
        " ${PARAM_UNPARSED_ARGUMENTS}"
    )
  endif()

  # Sets the toolchain binaries
  #   AR=${CMAKE_AR}
  #   AS=${CMAKE_ASM_COMPILER}
  #   LD=${CMAKE_LINKER}
  #   NM=${CMAKE_NM}
  #   OBJCOPY=${CMAKE_OBJCOPY}
  #   OBJDUMP=${CMAKE_OBJDUMP}
  #   RANLIB=${CMAKE_RANLIB}
  #   STRIP=${CMAKE_STRIP}
  #   CPP=${CMAKE_C_PREPROCESSOR}
  #   CC=${CMAKE_C_COMPILER}
  #   CXX=${CMAKE_CXX_COMPILER}
  #
  set(toolchain_binaries)
  if(CMAKE_AR)
    list(APPEND toolchain_binaries AR=${CMAKE_AR})
  endif()
  if(CMAKE_ASM_COMPILER)
    list(APPEND toolchain_binaries AS=${CMAKE_ASM_COMPILER})
  endif()
  if(CMAKE_LINKER)
    list(APPEND toolchain_binaries LD=${CMAKE_LINKER})
  endif()
  if(CMAKE_NM)
    list(APPEND toolchain_binaries NM=${CMAKE_NM})
  endif()
  if(CMAKE_OBJCOPY)
    list(APPEND toolchain_binaries OBJCOPY=${CMAKE_OBJCOPY})
  endif()
  if(CMAKE_OBJDUMP)
    list(APPEND toolchain_binaries OBJDUMP=${CMAKE_OBJDUMP})
  endif()
  if(CMAKE_RANLIB)
    list(APPEND toolchain_binaries RANLIB=${CMAKE_RANLIB})
  endif()
  if(CMAKE_STRIP)
    list(APPEND toolchain_binaries STRIP=${CMAKE_STRIP})
  endif()
  if(CMAKE_C_PREPROCESSOR)
    list(APPEND toolchain_binaries CPP=${CMAKE_C_PREPROCESSOR})
  endif()
  if(CMAKE_C_COMPILER)
    list(APPEND toolchain_binaries CC=${CMAKE_C_COMPILER})
  endif()
  if(CMAKE_CXX_COMPILER)
    list(APPEND toolchain_binaries CXX=${CMAKE_CXX_COMPILER})
  endif()

  string(STRIP "${toolchain_binaries}" toolchain_binaries)
  if(HUNTER_STATUS_DEBUG)
    string(
        REPLACE ";" "\n" toolchain_binaries_new_line "${toolchain_binaries}"
    )
    hunter_status_debug("Toolchain Binaries:")
    foreach(x ${toolchain_binaries})
      hunter_status_debug("  ${x}")
    endforeach()
  endif()

  # CPPFLAGS=${PARAM_CPPFLAGS} [-D${COMPILE_DEFINITIONS}]
  #          [-I${INCLUDE_DIRECTORIES}]
  #
  # C Preprocessor flags
  set(cppflags)
  get_directory_property(defs COMPILE_DEFINITIONS)
  foreach(def ${defs})
    set(cppflags "${cppflags} -D${def}")
  endforeach()

  get_directory_property(include_dirs INCLUDE_DIRECTORIES)
  foreach(include_dir ${include_dirs})
    set(cppflags
        "${cppflags} ${CMAKE_INCLUDE_SYSTEM_FLAG_CXX} ${include_dir}"
    )
  endforeach()

  set(cppflags "${cppflags} ${PARAM_CPPFLAGS}")
  string(STRIP "${cppflags}" cppflags)
  hunter_status_debug("CPPFLAGS=${cppflags}")

  # CFLAGS=${cflags} ${CMAKE_C_FLAGS}
  #
  # C Compiler Flags (defines or include directories should not be needed here)
  set(cflags "${CMAKE_C_FLAGS} ${PARAM_CFLAGS}")
  string(STRIP "${cflags}" cflags)
  hunter_status_debug("CFLAGS=${cflags}")

  # CXXFLAGS=${cxxflags} ${CMAKE_CXX_FLAGS}
  #
  # C++ Compiler flags (defines or include directories should not be needed here)
  set(cxxflags "${CMAKE_CXX_FLAGS} ${PARAM_CXXFLAGS}")
  string(STRIP "${cxxflags}" cxxflags)
  hunter_status_debug("CXXFLAGS=${cxxflags}")

  # LDFLAGS=${ldflags}
  #
  # Linker flags
  set(ldflags "${CMAKE_EXE_LINKER_FLAGS} ${PARAM_LDFLAGS}")
  string(STRIP "${ldflags}" ldflags)
  hunter_status_debug("LDFLAGS=${ldflags}")

  set(configure_host)
  string(COMPARE NOTEQUAL "${ANDROID}" "" is_android)
  string(COMPARE NOTEQUAL "${IPHONEOS_ARCHS}${IPHONESIMULATOR_ARCHS}" "" is_ios)
  string(COMPARE NOTEQUAL "${CROSS_COMPILE_TOOLCHAIN_PREFIX}" "" is_cross_compile)
  if(is_android)
    hunter_test_string_not_empty("${CMAKE_C_FLAGS}")
    hunter_test_string_not_empty("${CMAKE_CXX_FLAGS}")
    #AWP: in theory, lots of other checks should be in place.
    #  let RaspberryPi support mature so we get a better idea
    #  of where to put them.
    hunter_test_string_not_empty("${ANDROID_TOOLCHAIN_MACHINE_NAME}")
    set(configure_host --host=${ANDROID_TOOLCHAIN_MACHINE_NAME})
    set(ldflags "${ldflags} ${__libstl}")
  elseif(is_ios)
    if(BUILD_SHARED_LIBS)
      hunter_fatal_error("Autotools: building iOS libraries as shared is not supported")
    endif()
    set(ios_architectures)
    list(APPEND ios_architectures ${IPHONEOS_ARCHS} ${IPHONESIMULATOR_ARCHS})
  elseif(is_cross_compile)
    set(configure_host --host=${CROSS_COMPILE_TOOLCHAIN_PREFIX})
  endif()

  # Hunter builds static libraries by default
  if(BUILD_SHARED_LIBS)
    list(APPEND PARAM_EXTRA_FLAGS --enable-shared --disable-static)
  else()
    list(APPEND PARAM_EXTRA_FLAGS --disable-shared --enable-static)
  endif()

  if(HUNTER_STATUS_DEBUG)
    string(REPLACE ";" " " extra_flags "${PARAM_EXTRA_FLAGS}")
    hunter_status_debug("EXTRA_FLAGS=${extra_flags}")
  endif()

  # Build command and options
  set(build_command . "${PARAM_HUNTER_SELF}/scripts/clear-all.sh" && make)
  set(build_opts)
  string(COMPARE NOTEQUAL "${PARAM_PARALLEL_JOBS}" "" have_jobs)
  if(have_jobs)
    list(APPEND build_opts "-j" "${PARAM_PARALLEL_JOBS}")
  endif()

  set(configure_command "./configure")
  set(configure_command
      . "${PARAM_HUNTER_SELF}/scripts/clear-all.sh" && "${configure_command}"
  )

  # Build the configure command line options
  set(configure_opts)
  string(COMPARE NOTEQUAL "${configure_host}" "" has_configure_host)
  if(has_configure_host)
    list(APPEND configure_opts ${configure_host})
  endif()

  string(COMPARE NOTEQUAL "${toolchain_binaries}" "" has_changes)
  if(has_changes)
    list(APPEND configure_opts ${toolchain_binaries})
  endif()

  string(COMPARE NOTEQUAL "${cppflags}" "" has_cppflags)
  if(has_cppflags)
    list(APPEND configure_opts CPPFLAGS=${cppflags})
  endif()

  string(COMPARE NOTEQUAL "${cflags}" "" has_cflags)
  if(has_cflags)
    list(APPEND configure_opts CFLAGS=${cflags})
  endif()

  string(COMPARE NOTEQUAL "${cxxflags}" "" has_cxxflags)
  if(has_cxxflags)
    list(APPEND configure_opts CXXFLAGS=${cxxflags})
  endif()

  string(COMPARE NOTEQUAL "${ldflags}" "" hasldflags)
  if(hasldflags)
    list(APPEND configure_opts LDFLAGS=${ldflags})
  endif()

  if(PARAM_EXTRA_FLAGS)
    list(APPEND configure_opts ${PARAM_EXTRA_FLAGS})
  endif()

  if(NOT is_ios)
    ExternalProject_Add(${target_name}
        URL
          ${PARAM_URL}
        URL_HASH
          ${PARAM_URL_HASH}
        DOWNLOAD_DIR
          ${PARAM_DOWNLOAD_DIR}
        SOURCE_DIR
          ${PARAM_SOURCE_DIR}
        INSTALL_DIR
          ${PARAM_INSTALL_DIR}
          # not used, just avoid creating Install/<name> empty directory
        CONFIGURE_COMMAND
          ${configure_command}
          ${configure_opts}
          "--prefix=${PARAM_INSTALL_DIR}"
        BUILD_COMMAND
          ${build_command}
          ${build_opts}
        BUILD_IN_SOURCE
          1
        INSTALL_COMMAND
          make install
    )
  else()
    set(ios_universal_target ${target_name}-universal)
    ExternalProject_Add(${ios_universal_target}
        DOWNLOAD_COMMAND
          ""
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
        "${PARAM_SOURCE_DIR}/universal/autotools-lipo.cmake"
    )
    set(ios_built_arch_roots)
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
        hunter_fatal_error("iOS architecture: ${ios_architecture} not supported")
      endif()

      set(arch_flags)
      set(configure_opts)
      # Extra space at the end of the arch_flags is needed below when appending
      # to configure_opts, please do not remove!
      if(is_simulator)
        set(arch_flags "-arch ${ios_architecture} -isysroot ${IPHONESIMULATOR_SDK_ROOT} -miphoneos-version-min=${IOS_SDK_VERSION} ")
      else()
        set(arch_flags "-arch ${ios_architecture} -isysroot ${IPHONEOS_SDK_ROOT} -miphoneos-version-min=${IOS_SDK_VERSION} ")
      endif()

      list(APPEND configure_opts --host=${configure_host})
      list(APPEND configure_opts ${toolchain_binaries})
      list(APPEND configure_opts CPPFLAGS=${arch_flags}${cppflags})
      list(APPEND configure_opts CFLAGS=${arch_flags}${cflags})
      list(APPEND configure_opts CXXFLAGS=${arch_flags}${cxxflags})
      list(APPEND configure_opts LDFLAGS=${arch_flags}${ldflags})
      list(APPEND configure_opts ${PARAM_EXTRA_FLAGS})

      # architecture specific source dir
      set(arch_source_dir ${PARAM_SOURCE_DIR}/multi-arch-build/${ios_architecture})
      set(arch_install_dir ${PARAM_SOURCE_DIR}/multi-arch-install/${ios_architecture})
      set(arch_target ${target_name}-${ios_architecture})
      ExternalProject_Add(${arch_target}
          URL
            ${PARAM_URL}
          URL_HASH
            ${PARAM_URL_HASH}
          DOWNLOAD_DIR
            ${PARAM_DOWNLOAD_DIR}
          SOURCE_DIR
            ${arch_source_dir}
          INSTALL_DIR
            ${arch_install_dir}
            # not used, just avoid creating Install/<name> empty directory
          CONFIGURE_COMMAND
            ${configure_command}
            ${configure_opts}
            "--prefix=${arch_install_dir}"
          BUILD_COMMAND
            ${build_command}
            ${build_opts}
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
        "${PARAM_HUNTER_SELF}/scripts/autotools-lipo.cmake.in"
        "${PARAM_SOURCE_DIR}/universal/autotools-lipo.cmake"
        @ONLY
    )
  endif()
endfunction()
