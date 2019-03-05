#include <boost/config.hpp>
#include <boost/predef.h>

#if !defined(BOOST_REGEX_MATCH_EXTRA)
# error "BOOST_REGEX_MATCH_EXTRA not defined"
#endif

#if !defined(BOOST_MPL_CFG_NO_PREPROCESSED_HEADERS)
# error "BOOST_MPL_CFG_NO_PREPROCESSED_HEADERS not defined"
#endif

#if !defined(BOOST_MPL_LIMIT_LIST_SIZE)
# error "BOOST_MPL_LIMIT_LIST_SIZE not defined"
#endif

#if (BOOST_MPL_LIMIT_LIST_SIZE) != 3
# error "BOOST_MPL_LIMIT_LIST_SIZE is not 3"
#endif

int main() {
}
