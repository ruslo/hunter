if(HUNTER_STATUS_DEBUG)
  message("[hunter] Custom FindJPEG module")
endif()

find_package(JPEG CONFIG REQUIRED)
set(JPEG_LIBRARY JPEG::jpeg)
set(JPEG_INCLUDE_DIR "${JPEG_ROOT}/include")

# handle the QUIETLY and REQUIRED arguments and set JPEG_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(JPEG REQUIRED_VARS JPEG_LIBRARY JPEG_INCLUDE_DIR)

if(JPEG_FOUND)
  set(JPEG_LIBRARIES ${JPEG_LIBRARY})
endif()

# Do not mark as advanced:
#  * JPEG_INCLUDE_DIR
#  * JPEG_LIBRARY
# Problem with FindJasper. Looks like it's loading standard module anyway so
# expect some variables to be visible, otherwise will start a search again.
