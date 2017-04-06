// Copyright (c) 2017, Pawel Bylica
// All rights reserved.

#include <boost/random.hpp>

int main() {
  boost::random::mt19937 rng;
  boost::random::uniform_int_distribution<> six(1,6);
  return six(rng);
}
