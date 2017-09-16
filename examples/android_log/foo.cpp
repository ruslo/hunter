// Copyright (c) 2015, Ruslan Baratov
// All rights reserved.

#include <android/log.h>

int main() {
  __android_log_print(ANDROID_LOG_INFO, "foo", "boo");
}
