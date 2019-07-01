foreach(x gstreamer gst_plugins_ugly gst_plugins_good gst_plugins_base gst_plugins_bad)
  hunter_config(${x} VERSION 1.10.4)
endforeach()
