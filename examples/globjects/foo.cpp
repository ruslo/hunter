#include <glbinding/Version.h>
#include <globjects/globjects.h>

#include <iostream>

int main()
{
  // manage contexts
  globjects::init();

  // print version of unspecified context
  std::cout << "Current gl version: "
            << globjects::version()
            << std::endl;
}
