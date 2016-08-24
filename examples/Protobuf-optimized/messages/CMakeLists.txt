set(MESSAGES_PROTOS messages.proto)
set(MESSAGES_SRCS)
set(MESSAGES_HDRS)

#Code Generation
foreach(proto_file ${MESSAGES_PROTOS})
  get_filename_component(proto_file_abs ${proto_file} ABSOLUTE)
  get_filename_component(basename ${proto_file} NAME_WE)
  set(generated_files ${basename}.pb.cc ${basename}.pb.h)

  list(APPEND MESSAGES_SRCS ${basename}.pb.cc)
  list(APPEND MESSAGES_HDRS ${CMAKE_CURRENT_BINARY_DIR}/${basename}.pb.h)

  add_custom_command(
      OUTPUT ${generated_files}
      COMMAND protobuf::protoc --cpp_out ${CMAKE_CURRENT_BINARY_DIR} -I ${CMAKE_CURRENT_SOURCE_DIR} ${proto_file_abs}
      COMMENT "Generating ${generated_files} from ${proto_file}"
      VERBATIM
  )
endforeach()

add_library(messages ${MESSAGES_SRCS})
target_link_libraries(messages protobuf::libprotobuf)
target_include_directories(messages PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/..)
