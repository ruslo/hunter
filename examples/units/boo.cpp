#include <iostream>
#include <units.h>

using namespace std;
using namespace units::literals;
using units::length::meter_t;

int main() {

    meter_t a = 3_m;
    meter_t b = 4_m;
    cout << a * b << endl;
}
