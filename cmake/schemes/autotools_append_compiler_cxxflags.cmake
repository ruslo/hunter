# Copyright (c) 2015 Ruslan Baratov, Alexandre Pretyman
# All rights reserved.
#
# Adds to append_result 
# 	CXXFLAGS=${cxxflags} ${CMAKE_CXX_FLAGS}
#
function(autotools_append_compiler_cxxflags cxxflags append_result)
	#C++ Compiler flags (defines or include directories should not be needed here) 
	set(_cxxflags "${cxxflags} ${CMAKE_CXX_FLAGS}")
	string(STRIP "${_cxxflags}" _cxxflags)
	string(COMPARE NOTEQUAL "${_cxxflags}" "" has_cxxflags)
	if (has_cxxflags)
		set(${append_result} ${${append_result}} CXXFLAGS=${_cxxflags} PARENT_SCOPE)
	endif()
endfunction()


