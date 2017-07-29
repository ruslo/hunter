#include <doctest.h>
#include "foo.hpp"

namespace foo {
    TEST_CASE("foo_test") {
        REQUIRE_NOTHROW(return_true());
        REQUIRE(true == return_true());
    }
}
