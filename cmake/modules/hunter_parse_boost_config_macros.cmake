function(hunter_parse_boost_config_macros outvar)
  # parse ARGN to convert 'CONFIG_MACRO=id1;id2;CONFIG_MACRO_id3=3' to 'id1;id2;id3=3'
  unset(boost_config_macros_list)
  set(config_macros_without_value_mode FALSE)
  foreach(arg ${ARGN})
    if ("${arg}" MATCHES "[^=]+=.+")
      set(config_macros_without_value_mode FALSE)
    endif()
    if(config_macros_without_value_mode)
      # CONFIG_MACRO=id_1 id_2 ... id_n -> APPEND id_n
      list(APPEND boost_config_macros_list "${arg}")
    elseif("${arg}" MATCHES "^CONFIG_MACRO=(.+)" )
      # CONFIG_MACRO=id_1 id_2 ... id_n -> APPEND id_1
      list(APPEND boost_config_macros_list "${CMAKE_MATCH_1}")
      set(config_macros_without_value_mode TRUE)
    elseif("${arg}" MATCHES "^CONFIG_MACRO_([^=]+=.+)" )
      # CONFIG_MACRO_id=val -> APPEND id=val
      list(APPEND boost_config_macros_list "${CMAKE_MATCH_1}")
    endif()
  endforeach()
  set(${outvar} ${boost_config_macros_list} PARENT_SCOPE)
endfunction()
