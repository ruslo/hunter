#include <iostream>
#include <ros/time.h>
#include <ros/duration.h>

int main() {
    ros::Time::init();
    ros::Duration(3).sleep();
    std::cout << "Done" << std::endl;
    return 0;
}
