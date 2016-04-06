//  Report 0MQ version

#include <zmqpp/zmqpp.hpp>
#include <zmq.h>
#include <iostream>

int main (void)
{
    uint8_t zmqpp_mj, zmqpp_mn, zmqpp_rev;
    uint8_t zmq_mj, zmq_mn, zmq_rev;
    zmqpp::version(zmqpp_mj, zmqpp_mn, zmqpp_rev);
    zmqpp::zmq_version (zmq_mj, zmq_mn, zmq_rev);
    std::cout << "ZMQPP version: " << static_cast<int>(zmqpp_mj) << "." << static_cast<int>(zmqpp_mn) << "." << static_cast<int>(zmqpp_rev) << std::endl;
    std::cout << "ZeroMQ version: " << static_cast<int>(zmq_mj) << "." << static_cast<int>(zmq_mn) << "." << static_cast<int>(zmq_rev) << std::endl;
    return 0;
}
