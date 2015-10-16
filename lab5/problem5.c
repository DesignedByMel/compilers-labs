#include <stdio.h>

int f(int n, int choice) {
  int ans = 100;

  if (choice) {
    ans = n;
  } else {
    ans = n * ans;
  }
  return ans + 100;
}

int main(int argc, char *argv[]) {
  printf("Postitive: %d", f(2, 1));
  printf("\nEqual: %d", f(2,0));
  printf("\nNegative: %d", f(2, -1));
  return 0;
}
