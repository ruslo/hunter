#include <iostream> // std::cout
#include <boost/compute/core.hpp>

int main() {
  namespace compute = boost::compute;

  // get the default device
  compute::device device = compute::system::default_device();

  // print the device's name
  std::cout << "hello from " << device.name() << std::endl;

  return EXIT_SUCCESS;
}
