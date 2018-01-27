# DOCUMENTATION_START {

hunter_config(
    xgboost
    VERSION 0.40-p10
    CMAKE_ARGS XGBOOST_USE_HALF=ON XGBOOST_USE_CEREAL=ON XGBOOST_DO_LEAN=ON
)

hunter_config(ogles_gpgpu VERSION 0.2.8)

hunter_config(
    acf
    VERSION ${HUNTER_acf_VERSION}
    CMAKE_ARGS
    ACF_BUILD_OGLES_GPGPU=ON
)

if(ANDROID)
  # https://travis-ci.org/ingenue/hunter/jobs/287844545
  # Will be fixed in Android NDK 17
  hunter_config(dlib VERSION 19.2-p1)
else()
  hunter_config(
      dlib
      VERSION 19.6-p2
      CMAKE_ARGS
      DLIB_USE_BLAS=OFF
      DLIB_USE_LAPACK=OFF
      DLIB_USE_MKL_FFT=OFF
  )
endif()

# DOCUMENTATION_END }
