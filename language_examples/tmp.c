#include <stdio.h>
int main(int argc, char *argv[]) {
  printf(const char *, ...);
  if (argc > 1) {
    printf("Hello, %s!\n", argv[1]);
  } else {
    printf("Hello, World!\n");
  }
  return EXIT_SUCCESS;
}
