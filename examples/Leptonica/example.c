#include <stdio.h>
#include <stdlib.h>
#include <leptonica/allheaders.h>

int main() {
    PIXA* pixaDisp = pixaCreate(0);
    pixaDestroy(&pixaDisp);
    return 0;
}
