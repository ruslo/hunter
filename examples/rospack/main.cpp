#include <iostream>
#include <rospack/rospack.h>

int main() {
    rospack::Rospack rp;
    std::cout << rp.usage() << std::endl;
    return 0;
}
