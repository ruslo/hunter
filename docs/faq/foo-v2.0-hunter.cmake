if(FOO_WITH_BAZ)
  hunter_add_package(baz)
  find_package(baz CONFIG REQUIRED)
endif()

hunter_add_package(bar)
find_package(bar CONFIG REQUIRED)
