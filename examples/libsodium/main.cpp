#include <sodium.h>

int main(int argc, char **argv){
    if(sodium_init() != 0){
        return -1;
    }
    return 0;
}
