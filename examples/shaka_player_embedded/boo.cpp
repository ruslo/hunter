// Copyright 2016 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <stdio.h>
#include <stdlib.h>

#include <algorithm>
#include <functional>
#include <string>
#include <thread>
#include <vector>

#ifdef OS_POSIX
#  include <libgen.h>
#endif

#ifdef USING_V8
#  include <v8.h>
#endif

#include <SDL2/SDL.h>
#include <gflags/gflags.h>
#include <glog/logging.h>

#include <shaka/js_manager.h>
#include <shaka/player.h>
#include <shaka/sdl_frame_drawer.h>
#include <shaka/utils.h>
#include <shaka/video.h>

using shaka::JsManager;
using shaka::Player;
using shaka::SdlFrameDrawer;
using shaka::Video;

#ifndef SHAKA_SDL_UTILS
#  error "This demo requires SDL utils"
#endif

namespace {

#ifndef OS_IOS
std::string DirName(const char* arg0) {
#  ifdef OS_POSIX
  std::string copy = arg0;
  return dirname(&copy[0]);
#  else
#    error "Not implemented for Windows"
#  endif
}
#endif  // !OS_IOS


DEFINE_bool(muted, false, "Don't play any audio");
#ifdef USING_V8
DEFINE_string(v8_flags, "", "Pass the given flags to V8.");
#endif


class DemoApp : shaka::Player::Client {
 public:
  DemoApp(const char* exe_name)
      : window_(nullptr),
        renderer_(nullptr),
        js_engine_(GetOptions(exe_name)),
        video_(&js_engine_),
        player_(&js_engine_) {}

  ~DemoApp() override {
    // The destructors will automatically shut everything down.
  }

  bool Run() {
    if (!SetupWindow())
      return false;
    if (!InitializePlayer(FLAGS_muted))
      return false;
    if (!LoadAsset())
      return false;

    MainLoop();
    return true;
  }

 private:
  JsManager::StartupOptions GetOptions(const char* exe_name) {
    JsManager::StartupOptions opts;
#ifdef OS_IOS
    opts.dynamic_data_dir = std::string(getenv("HOME")) + "/Library";
    opts.static_data_dir = "./Frameworks/ShakaPlayerEmbedded.framework";
    opts.is_static_relative_to_bundle = true;
#else
    opts.static_data_dir = opts.dynamic_data_dir = DirName(exe_name);
#endif
    return opts;
  }

  bool SetupWindow() {
    const int width = 640;
    const int height = 480;
    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO) < 0) {
      LOG(ERROR) << "Error initializing SDL: " << SDL_GetError();
      return false;
    }

    window_ =
        SDL_CreateWindow("Shaka Player Embedded Demo", SDL_WINDOWPOS_CENTERED,
                         SDL_WINDOWPOS_CENTERED, width, height,
                         SDL_WINDOW_RESIZABLE | SDL_WINDOW_OPENGL);
    if (!window_) {
      LOG(ERROR) << "Error creating window: " << SDL_GetError();
      return false;
    }
    renderer_ = SDL_CreateRenderer(window_, -1, 0);
    if (!renderer_) {
      LOG(ERROR) << "Error getting renderer: " << SDL_GetError();
      return false;
    }
    drawer_.SetRenderer(renderer_);

    return true;
  }

  bool InitializePlayer(bool is_muted) {
    video_.Initialize();
    if (is_muted)
      video_.SetMuted(true);

    const auto init_results = player_.Initialize(&video_, this);
    if (init_results.has_error()) {
      LOG(ERROR) << "Error in initialize: " << init_results.error();
      return false;
    }

    return true;
  }

  bool LoadAsset() {
    const std::string uri =
        "//storage.googleapis.com/shaka-demo-assets/sintel-mp4-only/dash.mpd";
    auto results = player_.Load(uri);
    if (results.has_error()) {
      LOG(ERROR) << "Error in load: " << results.error();
      return false;
    }

    video_.Play();
    return true;
  }

  void MainLoop() {
    while (true) {
      SDL_Event ev;
      if (SDL_PollEvent(&ev) && ev.type == SDL_QUIT)
        break;

      SDL_RenderClear(renderer_);

      double delay = 1.0 / 60;
      auto frame = video_.DrawFrame(&delay);
      SDL_Texture* texture = drawer_.Draw(&frame);
      if (texture) {
        const int video_width = frame.width();
        const int video_height = frame.height();

        int win_width, win_height;
        SDL_GetWindowSize(window_, &win_width, &win_height);
        shaka::ShakaRect rect = shaka::FitVideoToWindow(
            video_width, video_height, win_width, win_height);
        SDL_Rect sdl_rect = {
            .x = rect.x, .y = rect.y, .w = rect.w, .h = rect.h};
        SDL_RenderCopy(renderer_, texture, nullptr, &sdl_rect);
      }
      SDL_RenderPresent(renderer_);

      SDL_Delay(delay * 1000);
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  // shaka::Player::Client implementation

  void OnError(const shaka::Error& err) override {
    // This is called from a background thread.
    LOG(ERROR) << "Error from Player:" << err;
  }

  void OnBuffering(bool buffering) override {
    // This is called from a background thread.
    LOG(INFO) << "Buffering status change from Player:" << buffering;
  }
  //////////////////////////////////////////////////////////////////////////////

  SDL_Window* window_;
  SDL_Renderer* renderer_;

  JsManager js_engine_;
  Video video_;
  Player player_;
  SdlFrameDrawer drawer_;
};

}  // namespace


int main(int argc, char** argv) {
  // Init flags and logging.
  FLAGS_alsologtostderr = true;
  gflags::ParseCommandLineFlags(&argc, &argv, true);
  google::InitGoogleLogging(argv[0]);

#ifdef USING_V8
  v8::V8::SetFlagsFromString(FLAGS_v8_flags.c_str(), FLAGS_v8_flags.length());
#endif

  DemoApp demo(argv[0]);
  return demo.Run() ? 0 : 1;
}
