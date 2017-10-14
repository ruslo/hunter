hunter_config(
    xgboost
    VERSION ${HUNTER_xgboost_VERSION}
    CMAKE_ARGS XGBOOST_USE_HALF=ON XGBOOST_USE_CEREAL=ON XGBOOST_DO_LEAN=ON
)

if(ANDROID)
  # https://travis-ci.org/ingenue/hunter/jobs/287844545
  hunter_config(dlib VERSION 19.2-p1)
endif()

if(MSVC)
  # https://ci.appveyor.com/project/ingenue/hunter/build/1.0.2532/job/idmsw2829ry1ltj6
  hunter_config(
      OpenCV
      VERSION
      3.0.0-p11
      CMAKE_ARGS
      WITH_IPP=OFF
      BUILD_EIGEN=OFF
      WITH_EIGEN=OFF
  )
endif()
