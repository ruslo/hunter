// Source : fft2d/sample1/testxg.c (open license)
//
// Reproduce samples for valid link test, since no headers are exported.
//
// This is used as a build test only.

#include <math.h>
#include <stdio.h>
#define MAX(x,y) ((x) > (y) ? (x) : (y))

/* random number generator, 0 <= RND < 1 */
#define RND(p) ((*(p) = (*(p) * 7141 + 54773) % 259200) * (1.0 / 259200.0))

#ifndef NMAX
#define NMAX 8192
#define NMAXSQRT 64
#endif

extern "C" {
void cdft(int, int, double *, int *, double *);
void putdata(int nini, int nend, double *a)
{
    int j, seed = 0;

    for (j = nini; j <= nend; j++) {
        a[j] = RND(&seed);
    }
}
double errorcheck(int nini, int nend, double scale, double *a)
{
    int j, seed = 0;
    double err = 0, e;

    for (j = nini; j <= nend; j++) {
        e = RND(&seed) - a[j] * scale;
        err = MAX(err, fabs(e));
    }
    return err;
}

} // extern "C"

int main()
{
    int n = 64, ip[NMAXSQRT + 2];
    double a[NMAX + 1], w[NMAX * 5 / 4], t[NMAX / 2 + 1], err;

    printf("data length n=? (must be 2^m)\n");
    //scanf("%d", &n);
    ip[0] = 0;

    /* check of CDFT */

    putdata(0, n - 1, a);
    cdft(n, 1, a, ip, w);
    cdft(n, -1, a, ip, w);
   return errorcheck(0, n - 1, 2.0 / n, a);
}

