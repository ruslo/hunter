hunter_config(
    xgboost
    VERSION 0.40-p10
    CMAKE_ARGS XGBOOST_USE_HALF=ON XGBOOST_USE_CEREAL=ON XGBOOST_DO_LEAN=ON
)

hunter_config(
    acf
    VERSION ${HUNTER_acf_VERSION}
    CMAKE_ARGS ACF_BUILD_OGLES_GPGPU=ON
)

if(ANDROID)
  # https://travis-ci.org/ingenue/hunter/jobs/287844545
  # Will be fixed in Android NDK 17
  hunter_config(dlib VERSION 19.2-p1)
  # error: 'struct lconv' has no member named 'decimal_point' -/-
  hunter_config(nlohmann_json VERSION 2.1.1-p1)
endif()
