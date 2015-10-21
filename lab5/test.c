#include <stdio.h>

int main()
{
  printf("Selector 1 : (2 + 4) + 2 = %d\n", phiNod(1, 2, 4));
  printf("Selector 2 : (2 * 4) + 2 = %d\n", phiNod(2, 2, 4));
  printf("Selector 3 : (2^4) + 2 = %d\n", phiNod(3, 2, 4));
  printf("Invalid Selector 4 : Should return -1 = %d\n", phiNod(4, 2, 4));
}
