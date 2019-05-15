# DOCUMENTATION_START {
hunter_config(
    CURL
    VERSION ${HUNTER_CURL_VERSION}
    CMAKE_ARGS CMAKE_USE_BORINGSSL=ON
)

hunter_config(
    v8
    VERSION 3.29.86-90da229-p0
)
# DOCUMENTATION_END }

if(IOS)
  # Test only compile/link, not real layout
  hunter_config(
      shaka_player_embedded
      VERSION ${HUNTER_shaka_player_embedded_VERSION}
      CMAKE_ARGS SHAKA_PLAYER_EMBEDDED_IOS_FRAMEWORK=OFF
  )
endif()
