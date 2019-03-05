// Copyright (c) 2015, David Hirvonen
// All rights reserved.

#include <boost/archive/binary_oarchive.hpp>
#include <boost/archive/binary_iarchive.hpp>

#include <boost/iostreams/filtering_stream.hpp>
#include <boost/iostreams/filtering_streambuf.hpp>
#include <boost/iostreams/filter/gzip.hpp>
#include <boost/iostreams/filter/bzip2.hpp>
#include <boost/iostreams/copy.hpp>

#include <iostream>
#include <fstream>

struct Record
{
  Record() {}
  Record(int age, const std::string &name) : age(age), name(name) {}

  int age;
  std::string name;

  // Boost serialization:
  //friend class boost::serialization::access;
  template<class Archive>  void serialize(Archive & ar, const unsigned int version)
  {
    ar & age;
    ar & name;
  }
};

int main(int argc, char **argv)
{
  std::string filename = "/tmp/record.dat";

  typedef boost::iostreams::zlib_compressor Compressor;
  typedef boost::iostreams::zlib_decompressor Decompressor;

  { // Dump the record:
    Record record(1, "kermit");
    std::ofstream ofs(filename, std::ios_base::out | std::ios_base::binary);
    if(ofs)
    {
      boost::iostreams::filtering_stream<boost::iostreams::output> buffer;
      buffer.push(Compressor());
      buffer.push(ofs);
      boost::archive::binary_oarchive oa(buffer);
      oa << record;
    }
  }

  { // Load the record
    Record record;
    std::ifstream ifs(filename, std::ios_base::in | std::ios_base::binary);
    if(ifs)
    {
      boost::iostreams::filtering_streambuf<boost::iostreams::input> buffer;
      buffer.push(Decompressor());
      buffer.push(ifs);
      boost::archive::binary_iarchive ia(buffer); // (ifs);
      ia >> record;
    }
  }
}

