#include "termcolor/termcolor.hpp"

#include <iostream>

using namespace termcolor;


int main(int, char**)
{
    std::cout << blue << on_green << "Blue in Green" << reset <<  " is the third tune on Miles "
        "Davis' 1959 album, Kind of " << blue << "Blue." << reset << std::endl;

    return 0;
}
