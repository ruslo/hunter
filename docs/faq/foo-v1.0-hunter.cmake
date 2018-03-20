if(WIN32)
  hunter_add_package(boo)
  find_package(boo CONFIG REQUIRED)
endif()

hunter_add_package(bar)
find_package(bar CONFIG REQUIRED)
