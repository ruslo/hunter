This is the [Hunter](https://github.com/ruslo/hunter/) repository fakey.

To add this repository to your cmake project, do:

~~~
HunterGate(...)
include(hunter_add_repository)
hunter_add_repository(
  URL https://www.github.com/fakey/fakey/archive/v0.0.1.tar.bz2
  SHA1 2d444140db0d53393b5490604006bb4f4896a444
)
project(...)
~~~

Hash and url should match a release on the github release page.

Package from this repo can be explictly enabled by adding the following line
`config.cmake`:

~~~
hunter_config(FlakeyBlamey REPOSITORY_NAME fakey REPOSITORY_VERSION 0.0.1)
~~~

Where `FlakeyBlamey` is the name of the package and `0.0.1` should be the
version of this repository specified in the first snippet above. This is only
necessary if the package exists in more than one repository.
