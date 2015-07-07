# Copyright (c) 2015 Ruslan Baratov, Alexandre Pretyman
# All rights reserved.
#
# This function builds the configure options for autotools
#
# hunter_autotools_configure_options(target_variable [PARAMETERS])
#   [PARAMETERS] are optional
#
# Usage example:
# hunter_autotools_configure_options(configure_opts
#     CPPFLAGS                        # C pre-processor flags
#       "-DEXAMPLE -I/usr/local/include/library"
#     CFLAGS                          # C Compiler flags
#       "-super-optimation"
#     CXXFLAGS                        # CXX compiler flags
#       "-super-optimation"
#     LDFLAGS                          # Linker flags
#       "-L/usr/local/lib -llibrary"
#     EXTRA_FLAGS                      # any other flag that will go at the end
#       --enable-feature
#       --disable-other
#       --with-library
#

include(hunter_fatal_error)
include(hunter_status_debug)
include(hunter_test_string_not_empty)

include(CMakeParseArguments) # cmake_parse_arguments

function(hunter_autotools_configure_options configure_opts)
  set(optional_params)
  set(one_value_params CPPFLAGS CFLAGS CXXFLAGS LDFLAGS)
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

  set(_configure_opts)
  set(_ldflags)
  string(COMPARE NOTEQUAL "${ANDROID}" "" is_android)
  if(is_android)
    hunter_test_string_not_empty("${CMAKE_C_FLAGS}")
    hunter_test_string_not_empty("${CMAKE_CXX_FLAGS}")
    #AWP: in theory, lots of other checks should be in place.
    #  lets wait for the RaspberryPi support so we get a better idea
    #  of where to put them.
    hunter_test_string_not_empty("${ANDROID_TOOLCHAIN_MACHINE_NAME}")
    list(APPEND _configure_opts --host=${ANDROID_TOOLCHAIN_MACHINE_NAME})
    set(_ldflags "${_ldflags} ${__libstl}")
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
  set(_toolchain_binaries)
  if(CMAKE_AR)
    list(APPEND _toolchain_binaries AR=${CMAKE_AR})
  endif()
  if(CMAKE_ASM_COMPILER)
    list(APPEND _toolchain_binaries AS=${CMAKE_ASM_COMPILER})
  endif()
  if(CMAKE_LINKER)
    list(APPEND _toolchain_binaries LD=${CMAKE_LINKER})
  endif()
  if(CMAKE_NM)
    list(APPEND _toolchain_binaries NM=${CMAKE_NM})
  endif()
  if(CMAKE_OBJCOPY)
    list(APPEND _toolchain_binaries OBJCOPY=${CMAKE_OBJCOPY})
  endif()
  if(CMAKE_OBJDUMP)
    list(APPEND _toolchain_binaries OBJDUMP=${CMAKE_OBJDUMP})
  endif()
  if(CMAKE_RANLIB)
    list(APPEND _toolchain_binaries RANLIB=${CMAKE_RANLIB})
  endif()
  if(CMAKE_STRIP)
    list(APPEND _toolchain_binaries STRIP=${CMAKE_STRIP})
  endif()
  if(CMAKE_C_PREPROCESSOR)
    list(APPEND _toolchain_binaries CPP=${CMAKE_C_PREPROCESSOR})
  endif()
  if(CMAKE_C_COMPILER)
    list(APPEND _toolchain_binaries CC=${CMAKE_C_COMPILER})
  endif()
  if(CMAKE_CXX_COMPILER)
    list(APPEND _toolchain_binaries CXX=${CMAKE_CXX_COMPILER})
  endif()

  string(STRIP "${_toolchain_binaries}" _toolchain_binaries)
  if(HUNTER_STATUS_DEBUG)
    string(
        REPLACE ";" "\n" _toolchain_binaries_new_line "${_toolchain_binaries}"
    )
    hunter_status_debug("Toolchain Binaries:")
    foreach(x ${_toolchain_binaries})
      hunter_status_debug("  ${x}")
    endforeach()
  endif()
  string(COMPARE NOTEQUAL "${_toolchain_binaries}" "" has_changes)
  if(has_changes)
    list(APPEND _configure_opts ${_toolchain_binaries})
  endif()

  # CPPFLAGS=${PARAM_CPPFLAGS} [-D${COMPILE_DEFINITIONS}]
  #          [-I${INCLUDE_DIRECTORIES}]
  #
  # C Preprocessor flags
  set(_cppflags)
  get_directory_property(defs COMPILE_DEFINITIONS)
  foreach(def ${defs})
    set(_cppflags "${_cppflags} -D${def}")
  endforeach()

  get_directory_property(include_dirs INCLUDE_DIRECTORIES)
  foreach(include_dir ${include_dirs})
    set(
        _cppflags
        "${_cppflags} ${CMAKE_INCLUDE_SYSTEM_FLAG_CXX} ${include_dir}"
    )
  endforeach()

  set(_cppflags "${_cppflags} ${PARAM_CPPFLAGS}")
  string(STRIP "${_cppflags}" cppflags)
  hunter_status_debug("CPPFLAGS=${_cppflags}")
  string(COMPARE NOTEQUAL "${_cppflags}" "" has_cppflags)
  if(has_cppflags)
    list(APPEND _configure_opts CPPFLAGS=${_cppflags})
  endif()

  # CFLAGS=${cflags} ${CMAKE_C_FLAGS}
  #
  # C Compiler Flags (defines or include directories should not be needed here)
  set(_cflags "${CMAKE_C_FLAGS} ${PARAM_CFLAGS}")
  string(STRIP "${_cflags}" _cflags)
  hunter_status_debug("CFLAGS=${_cflags}")
  string(COMPARE NOTEQUAL "${_cflags}" "" has_cflags)
  if(has_cflags)
    list(APPEND _configure_opts CFLAGS=${_cflags})
  endif()

  # CXXFLAGS=${cxxflags} ${CMAKE_CXX_FLAGS}
  #
  # C++ Compiler flags (defines or include directories should not be needed here)
  set(_cxxflags "${cxxflags} ${CMAKE_CXX_FLAGS}")
  hunter_status_debug("CXXFLAGS=${_cxxflags}")
  string(STRIP "${_cxxflags}" _cxxflags)
  string(COMPARE NOTEQUAL "${_cxxflags}" "" has_cxxflags)
  if(has_cxxflags)
    list(APPEND _configure_opts CXXFLAGS=${_cxxflags})
  endif()

  # LDFLAGS=${ldflags}
  #
  # Linker flags
  set(_ldflags "${_ldflags} ${CMAKE_EXE_LINKER_FLAGS} ${PARAM_LDFLAGS}")
  string(STRIP "${_ldflags}" _ldflags)
  hunter_status_debug("LDFLAGS=${_ldflags}")
  string(COMPARE NOTEQUAL "${_ldflags}" "" has_ldflags)
  if(has_ldflags)
    list(APPEND _configure_opts LDFLAGS=${_ldflags})
  endif()

  if(PARAM_EXTRA_FLAGS)
    list(APPEND _configure_opts ${PARAM_EXTRA_FLAGS})
  endif()

  if(HUNTER_STATUS_DEBUG)
    string(REPLACE ";" " " _extra_flags "${PARAM_EXTRA_FLAGS}")
    hunter_status_debug("EXTRA_FLAGS=${_extra_flags}")
  endif()

  set(${configure_opts} ${_configure_opts} PARENT_SCOPE)
endfunction()
