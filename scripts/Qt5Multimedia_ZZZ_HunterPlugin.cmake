# *_ZZZ_* added so this file will be loaded the last

string(COMPARE EQUAL "${_qt5Multimedia_install_prefix}" "" _is_empty)
if(_is_empty)
  message(FATAL_ERROR "Variable not set: _qt5Multimedia_install_prefix")
endif()

if(NOT EXISTS "${_qt5Multimedia_install_prefix}")
  message(
      FATAL_ERROR
      "Directory not exists: ${_qt5Multimedia_install_prefix}"
      " (variable _qt5Multimedia_install_prefix)"
  )
endif()

if(NOT IS_DIRECTORY "${_qt5Multimedia_install_prefix}")
  message(
      FATAL_ERROR
      "Is not directory: ${_qt5Multimedia_install_prefix}"
      " (variable _qt5Multimedia_install_prefix)"
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

# Type of multimedia plugin targets is always set to MODULE even if it's
# static library. Meanwhile Qt5Widgets installed always (qtbase component)
# and hence can be used for distinguishing static/shared build
find_package(Qt5Widgets REQUIRED)

get_target_property(_qt5_widgets_type Qt5::Widgets TYPE)
string(COMPARE EQUAL "${_qt5_widgets_type}" "STATIC_LIBRARY" _qt5_is_static)

if(TARGET Qt5::AVFServicePlugin)
  # AVFServicePlugin is not always installed,
  # for simplicity check existence of target

  if(_qt5_is_static)
    if(CMAKE_VERSION VERSION_LESS 3.1)
      message(
          WARNING
          "Can't use INTERFACE_SOURCES properties. "
          "Please update CMake to version 3.1+ or add source manually: "
          "\${QT_ROOT}/src/static_qt_AVFServicePlugin.cpp"
      )
    else()
      set_target_properties(
          Qt5::AVFServicePlugin
          PROPERTIES
          INTERFACE_SOURCES
          "${_qt5Multimedia_install_prefix}/src/static_qt_AVFServicePlugin.cpp"
      )
    endif()
  endif()

  # Fix linking errors
  if(IOS)
    # _CVPixelBufferGetBaseAddress
    _hunter_plugin_add_interface(Qt5::AVFServicePlugin "-framework CoreVideo")

    # _AVCaptureExposureDurationCurrent
    _hunter_plugin_add_interface(Qt5::AVFServicePlugin "-framework AVFoundation")

    # _CMFormatDescriptionGetMediaSubType
    _hunter_plugin_add_interface(Qt5::AVFServicePlugin "-framework CoreMedia")
  elseif(APPLE)
    _hunter_plugin_add_interface(Qt5::AVFServicePlugin "-framework AVFoundation")
    _hunter_plugin_add_interface(Qt5::AVFServicePlugin "-framework CoreMedia")
  endif()
endif()

if(TARGET Qt5::CoreAudioPlugin)
  # CoreAudioPlugin is not always installed (???)
  # for simplicity check existence of target

  if(IOS)
    # TODO
  elseif(APPLE)
    _hunter_plugin_add_interface(Qt5::CoreAudioPlugin "-framework AudioUnit")
    _hunter_plugin_add_interface(Qt5::CoreAudioPlugin "-framework AudioToolbox")
    _hunter_plugin_add_interface(Qt5::CoreAudioPlugin "-framework CoreAudio")
  endif()
endif()

if(TARGET Qt5::AVFMediaPlayerServicePlugin)
  # AVFMediaPlayerServicePlugin is not always installed,
  # for simplicity check existence of target

  if(IOS)
    find_package(Qt5MultimediaWidgets REQUIRED) # Qt5::MultimediaWidgets

    _hunter_plugin_add_interface(
        Qt5::AVFMediaPlayerServicePlugin Qt5::MultimediaWidgets
    )
  elseif(APPLE)
    _hunter_plugin_add_interface(
        Qt5::AVFMediaPlayerServicePlugin
        "-framework QuartzCore"
    )
  endif()
endif()

if(TARGET Qt5::DSServicePlugin)
  # DSServicePlugin is not always installed (Windows only?),
  # for simplicity check existence of target

  if(_qt5_is_static)
    if(CMAKE_VERSION VERSION_LESS 3.1)
      message(
          WARNING
          "Can't use INTERFACE_SOURCES properties. "
          "Please update CMake to version 3.1+ or add source manually: "
          "\${QT_ROOT}/src/static_qt_DSServicePlugin.cpp"
      )
    else()
      set_target_properties(
          Qt5::DSServicePlugin
          PROPERTIES
          INTERFACE_SOURCES
          "${_qt5Multimedia_install_prefix}/src/static_qt_DSServicePlugin.cpp"
      )
    endif()
  endif()
endif()

if(TARGET Qt5::CoreAudioPlugin)
  if(_qt5_is_static)
    if(IOS)
      # _AudioSessionGetProperty
      _hunter_plugin_add_interface(
          Qt5::CoreAudioPlugin "-framework AudioToolbox"
      )
    endif()
  endif()
endif()

if(TARGET Qt5::AudioCaptureServicePlugin)
  # AudioCaptureServicePlugin is not always installed (???),
  # for simplicity check existence of target

  if(_qt5_is_static)
    if(CMAKE_VERSION VERSION_LESS 3.1)
      message(
          WARNING
          "Can't use INTERFACE_SOURCES properties. "
          "Please update CMake to version 3.1+ or add source manually: "
          "\${QT_ROOT}/src/static_qt_AudioCaptureServicePlugin.cpp"
      )
    else()
      set_target_properties(
          Qt5::AudioCaptureServicePlugin
          PROPERTIES
          INTERFACE_SOURCES
          "${_qt5Multimedia_install_prefix}/src/static_qt_AudioCaptureServicePlugin.cpp"
      )
    endif()
  endif()
endif()

if(TARGET Qt5::AVFMediaPlayerServicePlugin)
  # AVFMediaPlayerServicePlugin is not always installed (???),
  # for simplicity check existence of target

  if(_qt5_is_static)
    if(CMAKE_VERSION VERSION_LESS 3.1)
      message(
          WARNING
          "Can't use INTERFACE_SOURCES properties. "
          "Please update CMake to version 3.1+ or add source manually: "
          "\${QT_ROOT}/src/static_qt_AVFMediaPlayerServicePlugin.cpp"
      )
    else()
      set_target_properties(
          Qt5::AVFMediaPlayerServicePlugin
          PROPERTIES
          INTERFACE_SOURCES
          "${_qt5Multimedia_install_prefix}/src/static_qt_AVFMediaPlayerServicePlugin.cpp"
      )
    endif()
  endif()
endif()

if(TARGET Qt5::CoreAudioPlugin)
  # CoreAudioPlugin is not always installed (???),
  # for simplicity check existence of target

  if(_qt5_is_static)
    if(CMAKE_VERSION VERSION_LESS 3.1)
      message(
          WARNING
          "Can't use INTERFACE_SOURCES properties. "
          "Please update CMake to version 3.1+ or add source manually: "
          "\${QT_ROOT}/src/static_qt_CoreAudioPlugin.cpp"
      )
    else()
      set_target_properties(
          Qt5::CoreAudioPlugin
          PROPERTIES
          INTERFACE_SOURCES
          "${_qt5Multimedia_install_prefix}/src/static_qt_CoreAudioPlugin.cpp"
      )
    endif()
  endif()
endif()

if(TARGET Qt5::QM3uPlaylistPlugin)
  # QM3uPlaylistPlugin is not always installed (???),
  # for simplicity check existence of target

  if(_qt5_is_static)
    if(CMAKE_VERSION VERSION_LESS 3.1)
      message(
          WARNING
          "Can't use INTERFACE_SOURCES properties. "
          "Please update CMake to version 3.1+ or add source manually: "
          "\${QT_ROOT}/src/static_qt_QM3uPlaylistPlugin.cpp"
      )
    else()
      set_target_properties(
          Qt5::QM3uPlaylistPlugin
          PROPERTIES
          INTERFACE_SOURCES
          "${_qt5Multimedia_install_prefix}/src/static_qt_QM3uPlaylistPlugin.cpp"
      )
    endif()
  endif()
endif()
