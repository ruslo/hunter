#include <boost/uuid/uuid.hpp> // uuid class
#include <boost/uuid/uuid_generators.hpp> // generators
#include <boost/uuid/uuid_io.hpp> // streaming operators etc.
#include <iostream> // std::cout

int main() {
  boost::uuids::uuid uuid = boost::uuids::random_generator()();
  std::cout << uuid << std::endl;
}
