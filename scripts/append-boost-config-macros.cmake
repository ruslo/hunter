# run at the boost source root
set(boost_user_config_file "boost/config/user.hpp")

set(define_without_value_mode FALSE)

foreach(i RANGE ${CMAKE_ARGC})

  if (define_without_value_mode)
    if ("${CMAKE_ARGV${i}}" MATCHES "[^=]+=.+")
      set(define_without_value_mode FALSE)
    endif()
  endif()

  unset(append_str)

  if(define_without_value_mode)
      # CONFIG_MACRO=id_1 id_2 ... id_n -> #define id_n
      set(append_str "#define ${CMAKE_ARGV${i}}")
  elseif("${CMAKE_ARGV${i}}" MATCHES "^CONFIG_MACRO=(.+)" )
    # CONFIG_MACRO=id_1 id_2 ... id_n -> #define id_1
    set(append_str "#define ${CMAKE_MATCH_1}")
    set(define_without_value_mode TRUE)
  elseif("${CMAKE_ARGV${i}}" MATCHES "^CONFIG_MACRO_([^=]+)=(.+)" )
    # CONFIG_MACRO_id=val -> #define id val
    set(append_str "#define ${CMAKE_MATCH_1} ${CMAKE_MATCH_2}")
  endif()

  if(append_str)
    message("-- append '${append_str}' to '${boost_user_config_file}'")
    file(APPEND "${boost_user_config_file}" "\n${append_str}\n")
  endif()

endforeach()
