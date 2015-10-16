#include <math.h>
#include <stdio.h>

float floatfunc(int x, float y);
int ackermann ( int m, int n ) ;

int main(int argc, char *argv[])
{
  printf("floatfunc: %f\n", floatfunc(10, 10.2)); // Probably shouldn ’t try running this ... :p
  printf("ackermann: %i\n", ackermann(6, 6));
  return 0 ;
}

float floatfunc(int x, float y)
{
  float ans = x;
  ans *= pow(y,x);
  ans -= sin(y);
  return ans ;
}

int ackermann(int m, int n)
{
  if (m == 0) {
    return n + 1;
  } else if (n == 0) {
    return ackermann(m  - 1, 1);
  } else {
    return ackermann(m - 1, ackermann(m, n - 1));
  }
}
