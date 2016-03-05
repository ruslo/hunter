
# required since no linking
include_directories(${PROTOBUF_INCLUDE_DIR})
PROTOBUF_GENERATE_CPP(MESSAGES_SRC MESSAGES_HEADER messages.proto)
add_library(messages ${MESSAGES_HEADER} ${MESSAGES_SRC})


