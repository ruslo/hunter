hunter_config(
    xgboost
    VERSION ${HUNTER_xgboost_VERSION}
    CMAKE_ARGS XGBOOST_USE_HALF=ON XGBOOST_USE_CEREAL=ON XGBOOST_DO_LEAN=ON
)

if(ANDROID)
  # https://travis-ci.org/ingenue/hunter/jobs/287844545
  # Will be fixed in Android NDK 17
  hunter_config(dlib VERSION 19.2-p1)
endif()
