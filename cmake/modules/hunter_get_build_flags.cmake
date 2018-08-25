# Copyright (c) 2017 Ruslan Baratov, Alexandre Pretyman
# All rights reserved.
#
# This function dump build flags.
# Only OUT_* paramaters which are passed will be written too (i.e. optional)
#
# Usage example:
# hunter_get_build_flags(
#   PACKAGE_CONFIGURATION_TYPES
#     "Release"                 # Mandatory ONE build config type
#   INSTALL_DIR
#     "${HUNTER_INSTALL_DIR}"   # Mandatory <root-id> of hunter
#   OUT_CPPFLAGS
#     cppflags                  # set cppflags with preprocessor flags
#   OUT_CFLAGS
#     cflags                    # set cflags with c compilation flags
#   OUT_CXXFLAGS
#     cxxflags                  # set cxxflags with c++ compilation flags
#   OUT_LDFLAGS
#     ldflags                   # set ldflags with linking flags
# )

include(CMakeParseArguments)

include(hunter_dump_cmake_flags)
include(hunter_fatal_error)
include(hunter_internal_error)
include(hunter_status_debug)

function(hunter_get_build_flags)
  set(optional_params)
  set(one_value_params
      INSTALL_DIR
      OUT_CPPFLAGS
      OUT_CFLAGS
      OUT_CXXFLAGS
      OUT_LDFLAGS
  )
  set(multi_value_params
      PACKAGE_CONFIGURATION_TYPES
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
        "Invalid arguments passed to hunter_get_build_flags"
        " ${PARAM_UNPARSED_ARGUMENTS}"
    )
  endif()

  string(COMPARE NOTEQUAL "${PARAM_INSTALL_DIR}" "" has_install_dir)
  if (NOT has_install_dir)
    hunter_internal_error(
        "hunter_get_build_flags expects INSTALL_DIR, it must be provided"
    )
  endif()

  list(LENGTH PARAM_PACKAGE_CONFIGURATION_TYPES len)
  if(NOT "${len}" EQUAL "1")
    hunter_fatal_error(
        "hunter_get_build_flags expects PACKAGE_CONFIGURATION_TYPES to have exactly 1 value, but has ${len} with elements: ${PARAM_PACKAGE_CONFIGURATION_TYPES}"
    )
  endif()
  string(TOUPPER ${PARAM_PACKAGE_CONFIGURATION_TYPES} config_type)

  hunter_status_debug(
      "Build flags config ${config_type} on dir ${PARAM_GLOBAL_INSTALLDIR}"
  )
  string(COMPARE NOTEQUAL "${PARAM_OUT_CPPFLAGS}" "" has_out_cppflags)
  string(COMPARE NOTEQUAL "${PARAM_OUT_CFLAGS}"   "" has_out_cflags)
  string(COMPARE NOTEQUAL "${PARAM_OUT_CXXFLAGS}" "" has_out_cxxflags)
  string(COMPARE NOTEQUAL "${PARAM_OUT_LDFLAGS}"  "" has_out_ldflags)

  if(has_out_cppflags)
    # CPPFLAGS=${PARAM_CPPFLAGS} [-D${COMPILE_DEFINITIONS}]
    #          [-I${INCLUDE_DIRECTORIES}]
    #
    # C Preprocessor flags

    hunter_dump_cmake_flags(CPPFLAGS cppflags)
    set(cppflags "${cppflags} -I${PARAM_INSTALL_DIR}/include")
    string(STRIP "${cppflags}" cppflags)
    # build config type definitions
    get_directory_property(defs
        COMPILE_DEFINITIONS_${config_type}
    )
    foreach(def ${defs})
      set(cppflags "${cppflags} -D${def}")
    endforeach()
    # non-build config specific definitions
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

    hunter_status_debug("  CPPFLAGS=${cppflags}")
    set(${PARAM_OUT_CPPFLAGS} ${cppflags} PARENT_SCOPE)
  endif()

  if(has_out_cflags)
    # CFLAGS=${cflags} ${CMAKE_C_FLAGS}
    #
    # C Compiler Flags (defines or include directories should not be needed here)
    set(cflags "${CMAKE_C_FLAGS_${config_type}} ${CMAKE_C_FLAGS}")
    string(STRIP "${cflags}" cflags)
    hunter_status_debug("  CFLAGS=${cflags}")
    set(${PARAM_OUT_CFLAGS} ${cflags} PARENT_SCOPE)
  endif()

  if(has_out_cxxflags)
    # CXXFLAGS=${cxxflags} ${CMAKE_CXX_FLAGS}
    #
    # C++ Compiler flags (defines or include directories should not be needed here)
    set(cxxflags
        "${CMAKE_CXX_FLAGS_${config_type}} ${CMAKE_CXX_FLAGS} ${PARAM_CXXFLAGS}"
    )
    string(STRIP "${cxxflags}" cxxflags)
    hunter_status_debug("  CXXFLAGS=${cxxflags}")
    set(${PARAM_OUT_CXXFLAGS} ${cxxflags} PARENT_SCOPE)
  endif()

  if(has_out_ldflags)
    # LDFLAGS=${ldflags}
    #
    # Linker flags
    set(ldflags "-L${PARAM_INSTALL_DIR}/lib")
    set(ldflags "${ldflags} ${CMAKE_EXE_LINKER_FLAGS_${config_type}}")
    string(STRIP "${ldflags}" ldflags)
    set(ldflags "${ldflags} ${CMAKE_EXE_LINKER_FLAGS}")
    string(STRIP "${ldflags}" ldflags)
    string(COMPARE NOTEQUAL "${ANDROID}" "" is_android)
    if(is_android)
        set(ldflags "${ldflags} ${__libstl}")
    endif()
    hunter_status_debug("  LDFLAGS=${ldflags}")
    set(${PARAM_OUT_LDFLAGS} ${ldflags} PARENT_SCOPE)
  endif()
endfunction()

