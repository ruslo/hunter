cmake_minimum_required(VERSION 3.0)

# run at the boost source root
set(boost_user_config_file "boost/config/user.hpp")

foreach(s ${BOOST_CONFIG_MACROS})
  unset(append_str)
  if("${s}" MATCHES "^([^=]+)=(.+)" )
    set(append_str "#define ${CMAKE_MATCH_1} ${CMAKE_MATCH_2}")
  else()
    set(append_str "#define ${s}")
  endif()
  if(append_str)
    message("-- append '${append_str}' to '${boost_user_config_file}'")
    file(APPEND "${boost_user_config_file}" "\n${append_str}\n")
  endif()
endforeach()
