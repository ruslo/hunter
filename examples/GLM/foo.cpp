#include <glm/geometric.hpp>       // glm::cross
#include <glm/gtx/string_cast.hpp> // glm::to_string
#include <glm/vec3.hpp>            // glm::vec3
#include <iostream>                // std::cout

int main() {
  glm::vec3 x(1, 0, 0), y(0, 1, 0);
  glm::vec3 z = glm::cross(x, y);
  std::cout << glm::to_string(x) << '\n'
            << glm::to_string(y) << '\n'
            << glm::to_string(z) << std::endl;
}
