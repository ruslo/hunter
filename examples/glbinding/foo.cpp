#include <glbinding/Version.h>
#include <iostream>

int main()
{
  std::cout << "Latest available gl version: "
            << glbinding::Version::latest()
            << std::endl;
}
