#include <libs3.h>

int main() {
  const char *userAgentInfo = "";
  int flags = 0;
  const char *defaultS3HostName = "";

  S3Status result = S3_initialize(userAgentInfo, flags, defaultS3HostName);
}
