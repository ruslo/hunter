if (ANDROID OR IOS)
    hunter_config(Protobuf
            VERSION ${HUNTER_Protobuf_VERSION}
            CMAKE_ARGS
                protobuf_BUILD_PROTOC=OFF
                protobuf_BUILD_LIBPROTOBUF_LITE=OFF
    )
else()
    hunter_config(Protobuf
            VERSION ${HUNTER_Protobuf_VERSION}
            CMAKE_ARGS
                protobuf_BUILD_LIBPROTOBUF_LITE=OFF
    )
endif()