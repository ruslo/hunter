Since not every package use CMake as a build tool there are templates for [ExternalProject_Add][1] command. These templates called [build schemes][2] and allow usage of custom build tools. For example see [tutorial][3] how to trigger `xcodebuild` instead of CMake. Command [hunter_pick_scheme][6] will help you to choose appropriate scheme if there are several of them.

## General

#### url_sha1_download.cmake.in
* [Scheme][4] used for downloading only. I.e. when you need to download something that is not an unpackable archive or archive that you don't want to unpack for any reason

#### url_sha1_unpack.cmake.in

* [Scheme][5] download and unpack archive without triggering any build commands. Examples: [CMake modules][8], [Clang tools extra][9] which is used as a subdirectory to [LLVM][10] project. Note that a header library can be installed as a regular project even if it has no binaries. See [Interface Libraries][13] and [example][14].

#### url_sha1_cmake.cmake.in

* [Scheme][7] used to build CMake projects. 

## Package special

Also refer to [Useful variables while building schemes](https://github.com/ruslo/hunter/wiki/dev.scheme_variables)

### Boost
* [url_sha1_boost.cmake.in](https://github.com/ruslo/hunter/blob/master/cmake/schemes/url_sha1_boost.cmake.in)
* [url_sha1_boost_ios_library.cmake.in](https://github.com/ruslo/hunter/blob/master/cmake/schemes/url_sha1_boost_ios_library.cmake.in)
* [url_sha1_boost_library.cmake.in](https://github.com/ruslo/hunter/blob/master/cmake/schemes/url_sha1_boost_library.cmake.in)

### OpenSSL
* [url_sha1_openssl.cmake.in](https://github.com/ruslo/hunter/blob/master/cmake/schemes/url_sha1_openssl.cmake.in)
* [url_sha1_openssl_ios.cmake.in][12]
* [url_sha1_openssl_windows.cmake.in][11]

### iOS-Sim
* [url_sha1_ios_sim.cmake.in](https://github.com/ruslo/hunter/blob/master/cmake/schemes/url_sha1_ios_sim.cmake.in)

[1]: http://www.cmake.org/cmake/help/v3.0/module/ExternalProject.html
[2]: https://github.com/ruslo/hunter/tree/master/cmake/schemes
[3]: https://github.com/ruslo/hunter/wiki/usr.adding.new.package.custom.scheme
[4]: https://github.com/ruslo/hunter/blob/master/cmake/schemes/url_sha1_download.cmake.in
[5]: https://github.com/ruslo/hunter/blob/master/cmake/schemes/url_sha1_unpack.cmake.in
[6]: https://github.com/ruslo/hunter/wiki/dev.modules#hunter_pick_scheme
[7]: https://github.com/ruslo/hunter/blob/master/cmake/schemes/url_sha1_cmake.cmake.in
[8]: https://github.com/ruslo/hunter/wiki/pkg.sugar
[9]: https://github.com/ruslo/hunter/blob/develop/cmake/projects/ClangToolsExtra/hunter.cmake
[10]: https://github.com/ruslo/hunter/blob/23a5a8342a4bdd81da336bc449e7e8707d77df18/cmake/config.cmake#L36
[11]: https://github.com/ruslo/hunter/blob/master/cmake/schemes/url_sha1_openssl_windows.cmake.in
[12]: https://github.com/ruslo/hunter/blob/master/cmake/schemes/url_sha1_openssl_ios.cmake.in
[13]: http://www.cmake.org/cmake/help/v3.0/manual/cmake-buildsystem.7.html#interface-libraries
[14]: https://github.com/ruslo/hunter/wiki/pkg.leathers