#include <iostream> // std::cout
#include <cblas.h>

int main() {
	double X[3];
	X[0] = 1;
	X[1] = 2;
	X[2] = 3;
	const int N = 3;
	const int incX = 1;

	double sum =  cblas_dasum(N, X, incX);
	std::cout << "sum over [1, 2, 3] = " << sum << std::endl;
}
