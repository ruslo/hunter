#include <glog/logging.h>

int main(int argc, char* argv[]) {
  google::InitGoogleLogging(argv[0]);

  FLAGS_logtostderr = 1;
  int num_cookies = 42;
  LOG(INFO) << "Found " << num_cookies << " cookies";
}
