#include <rang.hpp>

int main()
{
  std::cout << "Plain old text"
      << rang::style::bold << "Rang styled text!!"
      << rang::style::reset << std::endl;
}
