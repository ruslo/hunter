# Note: REQUESTED_PYTHON_VERSION is optional. Refer to Boost package documentation on how
# and when to use it: https://docs.hunter.sh/en/latest/packages/pkg/Boost.html#cmake-options
hunter_config(Boost VERSION ${HUNTER_Boost_VERSION} CMAKE_ARGS REQUESTED_PYTHON_VERSION=${REQUESTED_PYTHON_VERSION})
