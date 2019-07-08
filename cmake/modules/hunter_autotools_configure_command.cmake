# Copyright (c) 2017 Ruslan Baratov, Alexandre Pretyman
# All rights reserved.
#
# This function generates a ./configure command line for autotools
#
# Usage example:
# hunter_autotools_project(out_command_line # saves the result in this var
#   PACKAGE_CONFIGURATION_TYPES
#     "Release"                             # Mandatory ONE build config type
#   CONFIGURE_HOST
#     "armv7"                               # passed to --configure-host=
#   PACKAGE_INSTALL_DIR
#     "${HUNTER_PACKAGE_INSTALL_DIR}"       # passed to --prefix=
#   INSTALL_DIR
#     "${HUNTER_INSTALL_DIR}"               # <root-id> of hunter
#   CPPFLAGS
#     "-DEXTRA_CPP_FLAGS"                   # extra preprocessor flags
#   CFLAGS
#     "-O2"                                 # extra c compilation flags
#   CXXFLAGS
#     "-Wall"                               # extra c++ compilation flags
#   LDFLAGS
#     "-lmycrazylib"                        # extra linking flags
#   EXTRA_FLAGS
#     --any-other                           # extra flags to be appended
#     --flags
#     --needed
# )
include(CMakeParseArguments)

include(hunter_dump_cmake_flags)
include(hunter_fatal_error)
include(hunter_user_error)
include(hunter_get_build_flags)
include(hunter_get_toolchain_binaries)
include(hunter_internal_error)
include(hunter_status_debug)

function(hunter_autotools_configure_command out_command_line)
  set(optional_params)
  set(one_value_params
      CONFIGURE_HOST
      PACKAGE_INSTALL_DIR
      INSTALL_DIR
      CPPFLAGS
      CFLAGS
      CXXFLAGS
      LDFLAGS
  )
  set(multi_value_params
      PACKAGE_CONFIGURATION_TYPES
      EXTRA_FLAGS
  )
  cmake_parse_arguments(
      PARAM
      "${optional_params}"
      "${one_value_params}"
      "${multi_value_params}"
      ${ARGN}
  )

  if(PARAM_UNPARSED_ARGUMENTS)
    hunter_internal_error(
        "Invalid arguments passed to hunter_autotools_configure_command"
        " ${PARAM_UNPARSED_ARGUMENTS}"
    )
  endif()

  set(configure_host)
  string(COMPARE NOTEQUAL "${ANDROID}" "" is_android)
  string(COMPARE NOTEQUAL "${IPHONEOS_ARCHS}${IPHONESIMULATOR_ARCHS}" "" is_ios)
  string(COMPARE NOTEQUAL "${CROSS_COMPILE_TOOLCHAIN_PREFIX}" "" is_cross_compile)
  if(is_android)
    set(configure_host --host=${CMAKE_CXX_ANDROID_TOOLCHAIN_MACHINE})
  elseif(is_ios)
    string(COMPARE NOTEQUAL "${PARAM_CONFIGURE_HOST}" "" has_configure_host)
    if(has_configure_host)
      set(configure_host --host=${PARAM_CONFIGURE_HOST})
    else()
      hunter_user_error("hunter_autotools_configure_command on iOS build must supply a CONFIGURE_HOST")
    endif()
  elseif(is_cross_compile)
    set(configure_host --host=${CROSS_COMPILE_TOOLCHAIN_PREFIX})
  endif()



  # Build the configure command line options
  set(configure_command)

  list(APPEND configure_command "./configure")

  string(COMPARE NOTEQUAL "${configure_host}" "" has_configure_host)
  if(has_configure_host)
    list(APPEND configure_command ${configure_host})
  endif()

  hunter_get_toolchain_binaries(
      OUT_AR
        ar
      OUT_AS
        as
      OUT_LD
        ld
      OUT_NM
        nm
      OUT_OBJCOPY
        objcopy
      OUT_OBJDUMP
        objdump
      OUT_RANLIB
        ranlib
      OUT_STRIP
        strip
      OUT_CPP
        cpp
      OUT_CC
        cc
      OUT_CXX
        cxx
  )

  set(toolchain_binaries)
  if(ar)
    list(APPEND toolchain_binaries "AR=${ar}")
  endif()
  if(as)
    list(APPEND toolchain_binaries "AS=${as}")
  endif()
  if(ld)
    list(APPEND toolchain_binaries "LD=${ld}")
  endif()
  if(nm)
    list(APPEND toolchain_binaries "NM=${nm}")
  endif()
  if(objcopy)
    list(APPEND toolchain_binaries "OBJCOPY=${objcopy}")
  endif()
  if(objdump)
    list(APPEND toolchain_binaries "OBJDUMP=${objdump}")
  endif()
  if(ranlib)
    list(APPEND toolchain_binaries "RANLIB=${ranlib}")
  endif()
  if(strip)
    list(APPEND toolchain_binaries "STRIP=${strip}")
  endif()
  if(cpp)
    list(APPEND toolchain_binaries "CPP=${cpp}")
  endif()
  if(cc)
    list(APPEND toolchain_binaries "CC=${cc}")
  endif()
  if(cxx)
    list(APPEND toolchain_binaries "CXX=${cxx}")
  endif()

  if(toolchain_binaries)
    list(APPEND configure_command ${toolchain_binaries})
  endif()

  list(LENGTH PARAM_PACKAGE_CONFIGURATION_TYPES len)
  if(NOT "${len}" EQUAL "1")
    hunter_fatal_error(
        "Autotools PACKAGE_CONFIGURATION_TYPES has ${len} elements: ${PARAM_PACKAGE_CONFIGURATION_TYPES}. Only 1 is allowed"
        ERROR_PAGE "autools.package.configuration.types"
    )
  endif()
  string(TOUPPER ${PARAM_PACKAGE_CONFIGURATION_TYPES} config_type)

  hunter_get_build_flags(
      INSTALL_DIR
        ${PARAM_INSTALL_DIR}
      PACKAGE_CONFIGURATION_TYPES
        ${PARAM_PACKAGE_CONFIGURATION_TYPES}
      OUT_CPPFLAGS
        cppflags
      OUT_CFLAGS
        cflags
      OUT_CXXFLAGS
        cxxflags
      OUT_LDFLAGS
        ldflags
  )
  # -> CMAKE_C_FLAGS
  # -> CMAKE_CXX_FLAGS
  hunter_status_debug("Autotools complation/linking flags:")
  set(cppflags "${cppflags} ${PARAM_CPPFLAGS}")
  string(STRIP "${cppflags}" cppflags)
  hunter_status_debug("  CPPFLAGS=${cppflags}")
  list(APPEND configure_command CPPFLAGS=${cppflags})

  set(cflags "${cflags} ${PARAM_CFLAGS}")
  string(STRIP "${cflags}" cflags)
  hunter_status_debug("  CFLAGS=${cflags}")
  list(APPEND configure_command CFLAGS=${cflags})

  set(cxxflags "${cxxflags} ${PARAM_CXXFLAGS}")
  string(STRIP "${cxxflags}" cxxflags)
  hunter_status_debug("  CXXFLAGS=${cxxflags}")
  list(APPEND configure_command CXXFLAGS=${cxxflags})

  hunter_status_debug("  PARAM_LDFLAGS=${PARAM_LDFLAGS}")
  set(ldflags "${ldflags} ${PARAM_LDFLAGS}")
  string(STRIP "${ldflags}" ldflags)
  hunter_status_debug("  LDFLAGS=${ldflags}")
  list(APPEND configure_command LDFLAGS=${ldflags})


  if(PARAM_EXTRA_FLAGS)
    list(APPEND configure_command ${PARAM_EXTRA_FLAGS})
  endif()

  # Hunter builds static libraries by default
  if(BUILD_SHARED_LIBS)
    list(APPEND configure_command --enable-shared --disable-static)
  else()
    list(APPEND configure_command --disable-shared --enable-static)
  endif()

  list(APPEND configure_command "--prefix=${PARAM_PACKAGE_INSTALL_DIR}")

  # See: https://github.com/ruslo/hunter/pull/1910#discussion_r300725504
  list(
      APPEND
      configure_command
      "--with-pkg-config-libdir=${PARAM_PACKAGE_INSTALL_DIR}/lib/pkgconfig"
  )

  if(HUNTER_STATUS_DEBUG)
    string(REPLACE ";" " " final_configure_command "${configure_command}")
    hunter_status_debug("Final configure command:")
    hunter_status_debug("  ${final_configure_command}")
  endif()

  set(${out_command_line} ${configure_command} PARENT_SCOPE)
endfunction()

