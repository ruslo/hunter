### MODULE vs. CONFIG

Usually a package can be added to project using one of the `Find<Package>.cmake` standard CMake modules, e.g. [Boost](http://www.cmake.org/cmake/help/v3.2/module/FindBoost.html):

```cmake
set(Boost_USE_STATIC_LIBS ON)
find_package(Boost REQUIRED)
if(WIN32)
  add_definitions(-DBOOST_ALL_NO_LIB=1)
  add_definitions(${Boost_LIB_DIAGNOSTIC_DEFINITIONS})
endif()

include_directories(${Boost_INCLUDE_DIRS})
add_executable(foo foo.cpp)
```

Using CONFIG-mode of the `find_package` command will allow all this code to be substituted with literally two lines (see [Boost](https://github.com/ruslo/hunter/wiki/pkg.boost)):
```cmake
find_package(Boost CONFIG REQUIRED)
target_link_libraries(... Boost::boost)
    # include dirs (Boost_INCLUDE_DIRS) added automatically
    # definition BOOST_ALL_NO_LIB=1 added automatically too
```
effectively this will add a new [interface imported](http://www.cmake.org/cmake/help/v3.2/command/add_library.html#interface-libraries) target `Boost::boost` to your project.

* [Documentation](http://www.cmake.org/cmake/help/v3.0/manual/cmake-packages.7.html#config-file-packages)
* [Stackoverflow question](http://stackoverflow.com/a/20857070/2288008)

### Relocation challenge

Note that when your dependency is found by `Find<Package>.cmake` and then installed with CMake config, the public libraries will be linked with hardcoded paths. For instance:

```cmake
# CMakeLists.txt
find_package(Boost REQUIRED)
target_include_directories(foo PUBLIC ${Boost_INCLUDE_DIRS})
```

```bash
> cmake --build _builds --target install
Install the project...
-- Install configuration: "Release"
...
-- Installing: /<install-prefix>/lib/cmake/<package>/<package>Targets.cmake
-- Installing: /<install-prefix>/lib/cmake/<package>/<package>Targets-release.cmake
```
```bash
> grep -i interface_include /<install-prefix>/lib/cmake/<package>/<package>Targets.cmake
  INTERFACE_INCLUDE_DIRECTORIES "/<install-prefix>/include"
```

The bad thing about this is that when you pack your code and try to use it on another machine there will be no such directory like `/<install-prefix>/include/`. The solution to this problem is to use config-mode imported targets:
```cmake
# CMakeLists.txt
find_package(Boost CONFIG REQUIRED)
target_link_libraries(... PUBLIC Boost::boost)
```

```cmake
# <package>Config.cmake.in
# template file that will be installed with your library
# i.e. user don't need to call find_package(Boost CONFIG) explicitly
find_dependency(Boost CONFIG)
...
```

```bash
> cmake --build _builds --target install
> grep -i boost /<install-prefix>/lib/cmake/<package>/<package>Targets.cmake
  INTERFACE_LINK_LIBRARIES "Boost::boost"
```

As you can see now the hardcoded paths go away and the [find_dependency](http://www.cmake.org/cmake/help/v3.2/module/CMakeFindDependencyMacro.html) command will locate new paths when the package is moved to machine with a different `<install-prefix>`. Target `Boost::boost` will be linked automatically on `find_package`:

```cmake
# User's CMakeLists.txt
find_package(<package> CONFIG REQUIRED)

# find_package(Boost CONFIG REQUIRED) # not needed!
# target_link_libraries(... Boost::boost) # not needed!

target_link_libraries(... <package>::<imported-target>)
# add Boost::boost automatically with new <prefix-path>
```

Note that Hunter will download transitively as well:
```cmake
hunter_add_package(<package>)
# hunter_add_package(Boost) # not needed!

find_package(<package> CONFIG REQUIRED)
target_link_libraries(... <package>::<imported-target>)
```

### CMake

There is quite a lot of boilerplate code that you need to add, but the core of feature is these two lines (`Foo` is the project, `boo` is the target):
```cmake
install(TARGETS boo EXPORT FooTargets ...) # FooTarget.cmake now know about boo
install(EXPORT FooTargets ...) # install FooTarget.cmake
```

Next see real examples to run and documenation:

* [CMake documentation](http://www.cmake.org/cmake/help/v3.2/manual/cmake-packages.7.html#creating-packages)
* [Example](https://github.com/forexample/package-example)
* [Header-only library example](https://github.com/ruslo/leathers/blob/master/CMakeLists.txt) (see `install` section)