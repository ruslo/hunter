find_path(LIBBLAKE2S_INCLUDE_DIR libblake2s/blake2s.h)
find_library(LIBBLAKE2S_LIBRARY NAMES blake2s)

if (LIBBLAKE2S_INCLUDE_DIR AND LIBBLAKE2S_LIBRARY)
  set(LIBBLAKE2S_FOUND ON)

  if (NOT TARGET "libblake2s::libblake2s")
    add_library("libblake2s::libblake2s" UNKNOWN IMPORTED)
    set_target_properties("libblake2s::libblake2s"
      PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${LIBBLAKE2S_INCLUDE_DIR}"
      IMPORTED_LOCATION "${LIBBLAKE2S_LIBRARY}"
    )
  endif()
else()
  message(FATAL_ERROR "Libblake not found: inc=${LIBBLAKE2S_INCLUDE_DIR} lib=${LIBBLAKE2S_LIBRARY}")
endif()
