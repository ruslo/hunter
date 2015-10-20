# *_ZZZ_* added so this file will be loaded the last

string(COMPARE EQUAL "${_qt5Network_install_prefix}" "" _is_empty)
if(_is_empty)
  message(FATAL_ERROR "Variable not set: _qt5Network_install_prefix")
endif()

if(NOT EXISTS "${_qt5Network_install_prefix}")
  message(
      FATAL_ERROR
      "Directory not exists: ${_qt5Network_install_prefix}"
      " (variable _qt5Network_install_prefix)"
  )
endif()

if(NOT IS_DIRECTORY "${_qt5Network_install_prefix}")
  message(
      FATAL_ERROR
      "Is not directory: ${_qt5Network_install_prefix}"
      " (variable _qt5Network_install_prefix)"
  )
endif()

if(NOT TARGET Qt5::Network)
  message(FATAL_ERROR "No target Qt5::Network")
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

get_target_property(_qt5_type Qt5::Network TYPE)
string(COMPARE EQUAL "${_qt5_type}" "STATIC_LIBRARY" _qt5_is_static)

if(_qt5_is_static)
  # Fix linking errors
  if(IOS)
    _hunter_plugin_add_interface(Qt5::Network "-framework Security")
  endif()
endif()
