#include <glbinding/Version.h>
#include <iostream>

int main()
{
  std::cout << "OpenGL version: "
            << glbinding::Version().toString()
            << std::endl;
}
