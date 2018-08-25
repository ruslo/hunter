#include <proj.h>

#include <iostream>

int main() {
    PJ_INFO nfo = proj_info();
    std::cout << nfo.release << std::endl;
}
