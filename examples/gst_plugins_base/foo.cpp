#include <gst/gst.h>
#include <gst/video/video.h>

int main(int argc, char* argv[]){
    gst_init(&argc,&argv);

    GstElement* element = gst_element_factory_make("videotestsrc","test");

    return element == NULL ? -1 : 0;
}
