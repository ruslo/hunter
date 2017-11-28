#include <iostream> // std::cout
#include <cholmod.h>

int main() {
	// define variable
	cholmod_dense *A;

	cholmod_common c ;
	cholmod_start(&c) ; // start CHOLMOD
	A = cholmod_ones(3, 3, CHOLMOD_REAL, &c) ; // A = ones(3,3)
	std::cout << "norm(A): " << cholmod_norm_dense(A, 0, &c) << std::endl;
	cholmod_finish (&c) ; // finish CHOLMOD
}
