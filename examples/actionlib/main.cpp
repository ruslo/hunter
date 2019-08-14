#include <iostream>
#include <actionlib/client/simple_action_client.h>
#include <actionlib/server/simple_action_server.h>

int main() {
    ros::Time::init();
    ros::Duration(3).sleep();
    std::cout << "Done" << std::endl;
    return 0;
}
