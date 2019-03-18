#include <sqlpp11/sqlpp11.h>

int main(int argc, char** argv) {
  auto x = sqlpp::cte(sqlpp::alias::x);

  return 0;
}
