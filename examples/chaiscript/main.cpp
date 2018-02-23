#include <chaiscript/chaiscript.hpp> 
#include <iostream>

using namespace chaiscript;

int main(int argc, char ** argv) { 
  ChaiScript_Basic chai(
          std::make_unique<parser::ChaiScript_Parser<eval::Noop_Tracer,
                                                     optimizer::Optimizer_Default>>() 
      );
    //chaiscript::ChaiScript chai; 

    auto i = chai.eval<int>("return 1;");
    std::cout << "I (should be equal to 1) I:" << i << std::endl;

    return 0L;
}
