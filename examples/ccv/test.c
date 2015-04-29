#include "ccv.h"

// From: ccv/test/unit/algebra.tests.c 

int main(int argc, char **argv)
{ 
    ccv_dense_matrix_t* a = ccv_dense_matrix_new(3, 2, CCV_64F | CCV_C1, 0, 0);
    a->data.f64[0] = 0.11;
    a->data.f64[1] = 0.12;
    a->data.f64[2] = 0.13;
    a->data.f64[3] = 0.21;
    a->data.f64[4] = 0.22;
    a->data.f64[5] = 0.23;
    ccv_dense_matrix_t* b = ccv_dense_matrix_new(3, 2, CCV_64F | CCV_C1, 0, 0);
    b->data.f64[0] = 1011;
    b->data.f64[1] = 1012;
    b->data.f64[2] = 1021;
    b->data.f64[3] = 1022;
    b->data.f64[4] = 1031;
    b->data.f64[5] = 1032;
    ccv_dense_matrix_t* y = 0;
    ccv_gemm(a, b, 1, 0, 0, CCV_A_TRANSPOSE, (ccv_matrix_t**)&y, 0);

    ccv_matrix_free(a);
    ccv_matrix_free(b);
    ccv_matrix_free(y);
}
