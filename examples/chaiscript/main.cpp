#include <chaiscript/chaiscript.hpp> 
#include <iostream>

int main(int argc, char ** argv) { 
    chaiscript::ChaiScript chai; 

    auto i = chai.eval<int>("return 1;");
    std::cout << "I (should be equal to 1) I:" << i << std::endl;

    return 0L;
}
