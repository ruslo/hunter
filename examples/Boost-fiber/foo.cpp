#include <boost/fiber/fiber.hpp>
#include <boost/fiber/future.hpp>
#include <boost/fiber/future/packaged_task.hpp>


int calculate_the_answer_to_life_the_universe_and_everything()
{
    return 42;
}

int main() {
    boost::fibers::packaged_task<int()> pt(calculate_the_answer_to_life_the_universe_and_everything);
    boost::fibers::future<int> fi=pt.get_future();

    boost::fibers::fiber task(boost::move(pt)); // launch task on a thread

    fi.wait(); // wait for it to finish

    assert(fi.valid());
    assert(!fi.get_exception_ptr());
    assert(fi.get()==42);
}
