#include <iostream>
#include <nlohmann/json.hpp>

int main (int argc, char** argv) {

  // for convenience
  using json = nlohmann::json;

  json j2 = {
    {"pi", 3.141},
    {"happy", true},
    {"name", "Niels"},
    {"nothing", nullptr},
    {"answer", {
      {"everything", 42}
    }},
    {"list", {1, 0, 2}},
    {"object", {
      {"currency", "USD"},
      {"value", 42.99}
    }}
  };

  std::cout << j2 << std::endl;

  return 0;
}
