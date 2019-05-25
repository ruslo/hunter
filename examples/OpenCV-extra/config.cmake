hunter_config(OpenCV
    VERSION ${HUNTER_OpenCV_VERSION}
    CMAKE_ARGS
        OPENCV_WITH_EXTRA_MODULES=YES
		#disabled because of incorrect cmake install for ios
        BUILD_opencv_dnn=OFF
		#disabled because of incorrect cmake install for osx/ios
        BUILD_opencv_xobjdetect=OFF
        BUILD_opencv_hdf=OFF # not hunterized yet
)
