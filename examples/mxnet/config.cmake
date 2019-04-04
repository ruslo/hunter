# DOCUMENTATION_START {
# config.cmake

hunter_config(OpenCV VERSION 3.4.3-p4)
# DOCUMENTATION_END }

# See 'tvm' example
if(APPLE AND XCODE)
  hunter_config(
      LLVM
      VERSION
      ${HUNTER_LLVM_VERSION}
      CMAKE_ARGS
      LLVM_BUILD_EXTERNAL_COMPILER_RT=ON
  )
endif()
