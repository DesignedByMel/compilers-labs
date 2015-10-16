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
  f(1, 1);
  f(1, 0);
  return 0;
}
