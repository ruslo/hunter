#include <gst/gst.h>

int main(int argc, char* argv[]) {
    gst_init(&argc,&argv);

    GstElement* element = gst_element_factory_make("audiolatency","test");
    
    return element == NULL ? -1 : 0;
}
