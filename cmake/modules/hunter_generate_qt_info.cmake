# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(hunter_generate_qt_5_5_info)
include(hunter_generate_qt_5_6_info)
include(hunter_test_string_not_empty)
include(hunter_user_error)

# See cmake/projects/Qt/generate.sh

function(
    hunter_generate_qt_info
    component_name
    skip_components_varname
    component_depends_on_varname
    nobuild_varname
    qt_version
    is_android
    is_win32
)
  hunter_test_string_not_empty("${component_name}")
  hunter_test_string_not_empty("${skip_components_varname}")
  hunter_test_string_not_empty("${component_depends_on_varname}")
  hunter_test_string_not_empty("${nobuild_varname}")
  hunter_test_string_not_empty("${qt_version}")

  if(qt_version MATCHES "^5\\.5\\.")
    hunter_generate_qt_5_5_info(
        "${component_name}"
        toskip
        depends_on
        "${is_android}"
        "${is_win32}"
    )
  elseif(qt_version MATCHES "^5\\.6\\.")
    hunter_generate_qt_5_6_info(
        "${component_name}"
        toskip
        depends_on
        "${is_android}"
        "${is_win32}"
    )
  else()
    hunter_user_error("Unexpected Qt version")
  endif()

  set(
      nobuild
      "qtwebkit"
      "qtwebengine"
      "qtwebview"
      "qtwinextras"
      "qtx11extras"
  )

  set("${skip_components_varname}" "${toskip}" PARENT_SCOPE)
  set("${component_depends_on_varname}" "${depends_on}" PARENT_SCOPE)
  set("${nobuild_varname}" "${nobuild}" PARENT_SCOPE)
endfunction()
