#include <boost/thread/thread.hpp>
#include <boost/chrono/duration.hpp>

int main() {
    boost::this_thread::no_interruption_point::sleep_for(boost::chrono::seconds(2));
    //    boost::this_thread::sleep_for(boost::chrono::seconds(2));
}
