set(MESSAGES_PROTOS messages.proto)
set(MESSAGES_SRCS)
set(MESSAGES_HDRS)

#Code Generation
protobuf_generate_cpp(MESSAGES_PROTO_SRCS MESSAGES_PROTO_HDRS ${MESSAGES_PROTOS})
list(APPEND MESSAGES_SRCS ${MESSAGES_PROTO_SRCS})
list(APPEND MESSAGES_HDRS ${MESSAGES_PROTO_HDRS})

add_library(messages ${MESSAGES_SRCS})
target_include_directories(messages
    PUBLIC ${Protobuf_INCLUDE_DIRS}
    PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/..)
target_link_libraries(messages ${Protobuf_LIBRARIES})
