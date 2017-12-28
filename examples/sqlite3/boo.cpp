#include <sqlite3.h>

int main() {
  const char* db_name = "db_name";

  sqlite3* db;
  sqlite3_open(db_name, &db);
  sqlite3_close(db);
}
