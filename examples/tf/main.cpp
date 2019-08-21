#include <iostream>
#include "tf/tf.h"

int main() {
    ros::Time::init();
    ros::Duration(3).sleep();
    std::cout << "Done" << std::endl;
    return 0;
}
