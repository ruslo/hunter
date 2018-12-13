#include <nlohmann/fifo_map.hpp>
#include <string>

// for convenience
using nlohmann::fifo_map;

int main() {
    // create fifo_map with template arguments
    fifo_map<int, std::string> m;

    // add elements
    m[2] = "two";
    m[3] = "three";
    m[1] = "one";
    
    // output the map; will print
    // 2: two
    // 3: three
    // 1: one
    for (auto x : m) {
        std::cout << x.first << ": " << x.second << "\n";
    }
    
    // delete an element
    m.erase(2);
    
    // re-add element
    m[2] = "zwei";
    
    // output the map; will print
    // 3: three
    // 1: one
    // 2: zwei
    for (auto x : m) {
        std::cout << x.first << ": " << x.second << "\n";
    }
}

