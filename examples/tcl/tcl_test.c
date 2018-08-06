#include <stdio.h>
#include <tcl.h>

int main (int argc, char *argv[]) {

        Tcl_Interp *myinterp;
        char *action = "set a [expr 5 * 8]; puts $a";
        int status;

        printf ("Your Program will run ... \n");

        myinterp = Tcl_CreateInterp();
        status = Tcl_Eval(myinterp,action);

        printf ("Your Program has completed\n");
}

