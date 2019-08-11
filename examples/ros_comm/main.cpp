#include <iostream>
#include "ros/ros.h"
#include "ros/callback_queue_interface.h"
#include "rosbag/player.h"
#include "rosbag/bag.h"
#include "rosbag/bag_player.h"
#include "topic_tools/shape_shifter.h"
#include "message_filters/time_synchronizer.h"
#include "roslz4/lz4s.h"
#include "xmlrpcpp/XmlRpc.h"

int main() {
    ros::Time::init();
    ros::Duration(3).sleep();
    std::cout << "Done" << std::endl;
    return 0;
}
