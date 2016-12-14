#include <catch.hpp>
#include "foo.hpp"

namespace ns_foo {
    TEST_CASE("foo_test", "[foo]") {
        REQUIRE_NOTHROW(return_true());
        REQUIRE(true == return_true());
    }
}
