#include <chaiscript/chaiscript.hpp> 
#include <iostream>
#include <assert.h>

using namespace chaiscript;

using namespace chaiscript;

int main(int argc, char ** argv) { 
  ChaiScript_Basic chai(
          std::make_unique<parser::ChaiScript_Parser<eval::Noop_Tracer,
                                                     optimizer::Optimizer_Default>>() 
      );

    auto i = chai.eval<int>("return 1;");
    std::cout << "I (should be equal to 1) I:" << i << std::endl;
    assert(i == 1);

    return 0L;
}
