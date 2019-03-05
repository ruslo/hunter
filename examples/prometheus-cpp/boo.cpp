#include <prometheus/exposer.h>

int main() {
  using namespace prometheus;

  // create an http server running on port 8080
  Exposer exposer{"127.0.0.1:8080"};
}
