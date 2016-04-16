include(hunter_initialize_repository)
hunter_initialize_repository(NAME fakey VERSION 0.0.1)
# Could add directory with Find X files
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/Find")
