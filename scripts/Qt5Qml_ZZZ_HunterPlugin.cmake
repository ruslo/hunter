# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(NOT TARGET Qt5::Qml)
  message(FATAL_ERROR "Expected target Qt5::Qml")
endif()

get_target_property(_qt5_type Qt5::Qml TYPE)
string(COMPARE EQUAL "${_qt5_type}" "STATIC_LIBRARY" _qt5_is_static)

string(COMPARE EQUAL "${_qt5Qml_install_prefix}" "" _is_empty)
if(_is_empty)
  message(FATAL_ERROR "Variable not set: _qt5Qml_install_prefix")
endif()

if(NOT EXISTS "${_qt5Qml_install_prefix}")
  message(
      FATAL_ERROR
      "Directory not exists: ${_qt5Qml_install_prefix}"
      " (variable _qt5Qml_install_prefix)"
  )
endif()

if(NOT IS_DIRECTORY "${_qt5Qml_install_prefix}")
  message(
      FATAL_ERROR
      "Is not directory: ${_qt5Qml_install_prefix}"
      " (variable _qt5Qml_install_prefix)"
  )
endif()

# Add library, framework or link flags
function(_hunter_plugin_add_interface target lib)
  if(NOT TARGET "${target}")
    message(FATAL_ERROR "Target not exists: ${target}")
  endif()

  get_target_property(linked_libs ${target} INTERFACE_LINK_LIBRARIES)

  if(linked_libs)
    set_target_properties(
        ${target}
        PROPERTIES
        INTERFACE_LINK_LIBRARIES "${lib};${linked_libs}"
    )
  else()
    set_target_properties(
        ${target}
        PROPERTIES
        INTERFACE_LINK_LIBRARIES "${lib}"
    )
  endif()
endfunction()

function(_hunter_plugin_add_interface_release_debug target release debug)
  if(NOT TARGET "${target}")
    message(FATAL_ERROR "Target not exists: ${target}")
  endif()

  get_target_property(linked_libs ${target} INTERFACE_LINK_LIBRARIES)

  if(EXISTS "${release}" AND EXISTS "${debug}")
    set(debug_gen_expr "$<$<CONFIG:Debug>:${debug}>")
    set(nondebug_gen_expr "$<$<NOT:$<CONFIG:Debug>>:${release}>")
    set(gen_expr "${debug_gen_expr};${nondebug_gen_expr}")

    set_target_properties(
        ${target}
        PROPERTIES
        INTERFACE_LINK_LIBRARIES "${gen_expr};${linked_libs}"
    )
  else()
    if(EXISTS "${release}")
      set_target_properties(
          ${target}
          PROPERTIES
          INTERFACE_LINK_LIBRARIES "${release};${linked_libs}"
      )
    elseif(EXISTS "${debug}")
      set_target_properties(
          ${target}
          PROPERTIES
          INTERFACE_LINK_LIBRARIES "${debug};${linked_libs}"
      )
    else()
      message(FATAL_ERROR "At least one file must exist: ${release} ${debug}")
    endif()
  endif()
endfunction()

if(_qt5_is_static)
  if(IOS)
    _hunter_plugin_add_interface(Qt5::Qml Qt5::QTcpServerConnection)
  endif()
endif()
