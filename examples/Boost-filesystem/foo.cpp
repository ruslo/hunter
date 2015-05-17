#include <boost/filesystem.hpp>
#include <iostream> // std::cout

int main() {
  namespace fs = boost::filesystem;
  std::cout << "Current path: " << fs::current_path() << std::endl;
}
