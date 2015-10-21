#include <stdio.h>

int main(int argc, char *argv[])
{
  int i = 0;
  printf("Fibonancci Series from 0 to 20\n");

  for( ; i < 21 ; i++){
    printf("%d ", fib(i));
  }
  return 0 ;
}
