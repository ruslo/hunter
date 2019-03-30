# https://github.com/ruslo/hunter/pull/943#issuecomment-321534754

# DOCUMENTATION_START {
# config.cmake

if(APPLE AND XCODE)
  hunter_config(
      LLVM
      VERSION
      ${HUNTER_LLVM_VERSION}
      CMAKE_ARGS
      LLVM_BUILD_EXTERNAL_COMPILER_RT=ON
  )
endif()
# DOCUMENTATION_END }
