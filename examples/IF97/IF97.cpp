// This compiler flag causes input/output units on the Thermodynamic Properties in IF97.h
// to take pressure units of [MPa] and Energy units of [kJ] for comparison with IAPWS
// table values.  If not set, the default behavior of IF97.h is to use straight SI units
// with pressure in [Pa] and enthalpy in [J].
#define IAPWS_UNITS

#include <IF97.h>
#include <stdio.h>

int main(){

    using namespace IF97;

    printf("*****************************************************************\n");
    printf("******************** Verification Tables ************************\n");
    printf("* Tables below are printed for verification.  Unless otherwise  *\n");
    printf("* noted, tables are reproduced from the                         *\n");
    printf("* \"Revised Release on the IAPWS Industrial Formulation 1997\"    *\n");
    printf("* IAPWS R7-97(2012).                                            *\n");
    printf("*****************************************************************\n\n\n");


    double T1 = 300, T2 = 300, T3 = 500, p1 = 3, p2 = 80, p3 = 3;
    printf("*****************************************************************\n");
    printf("******************** Table 5 - Region 1 *************************\n");
    printf("*****************************************************************\n");
    printf("%5s %11.8e %11.8e %11.8e\n", "v", 1/rhomass_Tp(T1, p1), 1/rhomass_Tp(T2, p2), 1/rhomass_Tp(T3, p3));
    printf("%5s %11.8e %11.8e %11.8e\n", "h", hmass_Tp(T1, p1), hmass_Tp(T2, p2), hmass_Tp(T3, p3));
    printf("%5s %11.8e %11.8e %11.8e\n", "u", umass_Tp(T1, p1), umass_Tp(T2, p2), umass_Tp(T3, p3));
    printf("%5s %11.8e %11.8e %11.8e\n", "s", smass_Tp(T1, p1), smass_Tp(T2, p2), smass_Tp(T3, p3));
    printf("%5s %11.8e %11.8e %11.8e\n", "cp", cpmass_Tp(T1, p1), cpmass_Tp(T2, p2), cpmass_Tp(T3, p3));
    printf("%5s %11.8e %11.8e %11.8e\n", "w", speed_sound_Tp(T1, p1), speed_sound_Tp(T2, p2), speed_sound_Tp(T3, p3));
    printf("***************************************************************\n\n");
    
    return 0;
}