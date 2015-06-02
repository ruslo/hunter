// Copyright (c) 2015, Ruslan Baratov
// All rights reserved.

#include <boost/filesystem.hpp>

#include <android_native_app_glue.h>
#include <android/log.h>

void android_main(struct android_app* state) {
  app_dummy(); // Make sure glue isn't stripped

  namespace fs = boost::filesystem;

  __android_log_print(
      ANDROID_LOG_INFO,
      "BoostFilesystemExample",
      fs::current_path().c_str()
  );

  ANativeActivity_finish(state->activity);
}
